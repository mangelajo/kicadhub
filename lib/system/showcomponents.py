import sys
from pcbnew import *
import tempfile
tempfile.tempdir='/tmp/'


board = LoadBoard(sys.argv[1])

references = sys.argv[2:]


pctl = PLOT_CONTROLLER(board)

popt = pctl.AccessPlotOpts()

popt.SetPlotValue(False)

tmpdir = tempfile.mktemp()

popt.SetOutputDirectory(tmpdir)


popt.SetLineWidth(FromMM(0.35))

popt.SetAutoScale(False)
popt.SetScale(1)
popt.SetMirror(False)
popt.SetUseAuxOrigin(True)

popt.SetPlotFrameRef(False)

pctl.OpenPlotfile("AssemblyguideFRBG", PLOT_FORMAT_PDF, "Assembly guide BG")
pctl.SetColorMode(False)
pctl.PlotLayer(SILKSCREEN_N_FRONT)
pctl.PlotLayer(EDGE_N)

popt.SetMirror(True)
pctl.OpenPlotfile("AssemblyguideBKBG", PLOT_FORMAT_PDF, "Assembly guide BG")
pctl.SetColorMode(False)
pctl.PlotLayer(SILKSCREEN_N_BACK)
pctl.PlotLayer(EDGE_N)

if len(references)>0:

    popt.SetPlotFrameRef(False)
    popt.SetMirror(False)
    pctl.OpenPlotfile("AssemblyguideFR", PLOT_FORMAT_PDF, "Assembly guide FR")

    for module in board.GetModules():
        if not(module.GetReference() in references):
            board.Delete(module)

    pctl.SetColorMode(False)
    pctl.PlotLayer(SILKSCREEN_N_FRONT)
    pctl.PlotLayer(EDGE_N)

    popt.SetMirror(True)
    pctl.OpenPlotfile("AssemblyguideBK", PLOT_FORMAT_PDF, "Assembly guide BK")
    pctl.SetColorMode(False)
    pctl.PlotLayer(SILKSCREEN_N_BACK)
    pctl.PlotLayer(EDGE_N)



pctl.ClosePlot()



from os import listdir
from os.path import isfile, join
from os import system
onlyfiles = [ f for f in listdir(tmpdir) if isfile(join(tmpdir,f)) and f.endswith("BG.pdf") ]


if len(references)==0:
    for file in onlyfiles:
        in_file = join(tmpdir,file)
        out_file = in_file.replace(".pdf",".png")
        print out_file
        system("convert -density 300 -background white "+in_file+" -trim +repage "+out_file)
else:
    for file in onlyfiles:
            in_file = join(tmpdir,file)
            in_file2 = in_file.replace("BG.pdf",".pdf")
            out_file = in_file.replace("BG.pdf",".png")
            cmdline = "convert -density 300 %s %s -alpha on -compose dissolve -define compose:args='100,20' -composite %s" %(in_file,in_file2,out_file+"tmp.png")
            system(cmdline)

            cmdline = "convert %s -trim +repage %s"%(out_file+"tmp.png",out_file)
            system(cmdline)
            print out_file