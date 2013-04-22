import sys
from pcbnew import *
import tempfile
tempfile.tempdir='/tmp/'
tmpdir = tempfile.mktemp()


board = LoadBoard(sys.argv[1])



pctl = PLOT_CONTROLLER(board)
popt = pctl.AccessPlotOpts()

popt.SetPlotValue(False)
popt.SetOutputDirectory(tmpdir)
popt.SetLineWidth(FromMM(0.35))
popt.SetAutoScale(False)
popt.SetScale(1)
popt.SetMirror(False)
popt.SetUseAuxOrigin(True)
popt.SetPlotFrameRef(False)
popt.SetMirror(False)

pctl.OpenPlotfile("preview", PLOT_FORMAT_PDF, "Preview file")
pctl.SetColorMode(True)
popt.SetReferenceColor(YELLOW)
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


# Export the copper layers too... exporting one of them in filled mode with
# drill marks will put the marks in the WHITE later (since it tries to blank
# the pads...); these will be obviously great reference points for snap
# and stuff in the cad. A pctl function to only plot them would be
# better anyway...

popt.SetColor(20)
popt.SetMode(FILLED)
popt.SetDrillMarksType(PCB_PLOT_PARAMS.FULL_DRILL_SHAPE)
pctl.PlotLayer(0)
popt.SetColor(17)
popt.SetDrillMarksType(PCB_PLOT_PARAMS.NO_DRILL_SHAPE)
pctl.PlotLayer(LAYER_N_FRONT)

popt.SetColor(3)
pctl.PlotLayer(SILKSCREEN_N_FRONT)

pctl.ClosePlot()

from os import listdir
from os.path import isfile, join
from os import system
onlyfiles = [ f for f in listdir(tmpdir) if isfile(join(tmpdir,f)) ]

for file in onlyfiles:
    in_file = join(tmpdir,file)
    out_file = in_file.replace(".pdf",".png")
    print out_file
    system("convert -density 300 -background white "+in_file+" -trim +repage "+out_file)

