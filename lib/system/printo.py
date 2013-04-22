import sys

from pcbnew import *
board = LoadBoard(sys.argv[1])
pctl = PLOT_CONTROLLER(board)

popt = pctl.AccessPlotOpts()

popt.SetOutputDirectory("/tmp/fabs/")

popt.SetPlotFrameRef(True)
popt.SetLineWidth(FromMM(0.35))

pctl.OpenPlotfile("empty", PLOT_FORMAT_PDF, "Empty PDF plot ")

pctl.OpenPlotfile("empty", PLOT_FORMAT_SVG, "Empty SVG plot ")


popt.SetAutoScale(False)
popt.SetScale(1)
popt.SetMirror(False)

pctl.OpenPlotfile("Silk", PLOT_FORMAT_PDF, "Assembly guide")
pctl.PlotLayer(SILKSCREEN_N_FRONT)
popt.SetScale(1)

popt.SetUseAuxOrigin(True)

# This by gerbers only (also the name is truly horrid!)
popt.SetSubtractMaskFromSilk(True)

# Once the defaults are set it become pretty easy...
# I have a Turing-complete programming language here: I'll use it...

plot_plan = [
    ( "Top", LAYER_N_FRONT, "Top layer" ),
    ( "Bottom", LAYER_N_BACK, "Bottom layer" ),
    ( "PasteTop", SOLDERPASTE_N_FRONT, "Paste top" ),
    ( "SilkTop", SILKSCREEN_N_FRONT, "Silk top" ),
    ( "MaskBottom", SOLDERMASK_N_BACK, "Mask bottom" ),
    ( "MaskTop", SOLDERMASK_N_FRONT, "Mask top" ),
    ( "Drawings", DRAW_N, "Fabrication" ),
    ( "Comment", COMMENT_N, "Comments" ),
    ( "Edge", EDGE_N, "Edges" ),
]


for layer_info in plot_plan:
    pctl.OpenPlotfile(layer_info[0], PLOT_FORMAT_GERBER, layer_info[2])
    pctl.PlotLayer(layer_info[1])

# Our fabricators want two additional gerbers:
# An assembly with no silk trim and all and only the references
# (you'll see that even holes have designators, obviously)
popt.SetSubtractMaskFromSilk(False)
popt.SetPlotReference(True)
popt.SetPlotValue(False)
popt.SetPlotOtherText(False)
popt.SetPlotInvisibleText(True)
pctl.OpenPlotfile("AssyTop", PLOT_FORMAT_PDF, "Assembly top")
pctl.PlotLayer(SILKSCREEN_N_FRONT)

# And a gerber with only the component outlines (really!)
popt.SetPlotReference(False)
popt.SetPlotInvisibleText(False)
pctl.OpenPlotfile("AssyOutlinesTop", PLOT_FORMAT_PDF, "Assembly outline top")
pctl.PlotLayer(SILKSCREEN_N_FRONT)

# The same could be done for the bottom side, if there were components
popt.SetUseAuxOrigin(False)

## For documentation we also want a general layout PDF
## I usually use a shell script to merge the ps files and then distill the result
## Now I can do it with a control file. As a bonus I can have references in a
## different colour, too.

popt.SetPlotReference(True)
popt.SetPlotValue(True)
popt.SetPlotOtherText(True)
popt.SetPlotInvisibleText(False)
# Remember that the frame is always in color 0 (BLACK) and should be requested
# before opening the plot
popt.SetPlotFrameRef(True)
pctl.OpenPlotfile("Layout", PLOT_FORMAT_PDF, "General layout")

pctl.PlotLayer(DRAW_N)

# Do the PCB edges in yellow
popt.SetColor(YELLOW)
pctl.PlotLayer(EDGE_N)

## Comments in, uhmm... green
popt.SetColor(GREEN)
pctl.PlotLayer(COMMENT_N)

# Bottom mask as lines only, in red
popt.SetMode(LINE)
popt.SetColor(RED)
pctl.PlotLayer(SOLDERMASK_N_BACK)

# Top mask as lines only, in blue
popt.SetColor(BLUE)
pctl.PlotLayer(SOLDERMASK_N_FRONT)

# Top paste in light blue, filled
popt.SetColor(BLUE)
popt.SetMode(FILLED)
pctl.PlotLayer(SOLDERPASTE_N_FRONT)

# Top Silk in cyan, filled, references in dark cyan
popt.SetReferenceColor(DARKCYAN)
popt.SetColor(CYAN)
pctl.PlotLayer(SILKSCREEN_N_FRONT)

popt.SetTextMode(PLOTTEXTMODE_STROKE)
pctl.OpenPlotfile("Assembly", PLOT_FORMAT_SVG, "Master Assembly")
pctl.SetColorMode(True)

# We want *everything*
popt.SetPlotReference(True)
popt.SetPlotValue(True)
popt.SetPlotOtherText(True)
popt.SetPlotInvisibleText(True)

# Remember than the DXF driver assigns colours to layers. This means that
# we will be able to turn references on and off simply using their layers
# Also most of the layer are now plotted in 'line' mode, because DXF handles
# fill mode almost like sketch mode (this is to keep compatibility with
# most CAD programs; most of the advanced primitive attributes required are
# handled only by recent autocads...); also the entry level cads (qcad
# and derivatives) simply don't handle polyline widths...

# Here I'm using numbers for colors and layers, I'm too lazy too look them up:P
popt.SetReferenceColor(19)
popt.SetValueColor(21)

popt.SetColor(0)
popt.SetMode(LINE)
pctl.PlotLayer(24)
popt.SetColor(14)
pctl.PlotLayer(28)
popt.SetColor(2)
pctl.PlotLayer(25)
popt.SetColor(4)
pctl.PlotLayer(22)
popt.SetColor(1)
pctl.PlotLayer(23)
popt.SetColor(9)
pctl.PlotLayer(19)
popt.SetColor(3)
pctl.PlotLayer(21)

# Export the copper layers too... exporting one of them in filled mode with
# drill marks will put the marks in the WHITE later (since it tries to blank
# the pads...); these will be obviously great reference points for snap
# and stuff in the cad. A pctl function to only plot them would be
# better anyway...

popt.SetColor(17)
popt.SetMode(FILLED)
popt.SetDrillMarksType(PCB_PLOT_PARAMS.FULL_DRILL_SHAPE)
pctl.PlotLayer(15)
popt.SetColor(20)
popt.SetDrillMarksType(PCB_PLOT_PARAMS.NO_DRILL_SHAPE)
#pctl.PlotLayer(0)

# At the end you have to close the last plot, otherwise you don't know when
# the object will be recycled!
pctl.ClosePlot()

# We have just generated 21 plotfiles with a single script
