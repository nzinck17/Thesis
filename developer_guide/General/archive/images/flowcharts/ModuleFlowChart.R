

require(DiagrammeR)





pdf_digraph <- function(filename, code, width = 500, height = NULL){
  capture.output({
    g <- grViz(paste("digraph{", code, "}"))
    DiagrammeRsvg::export_svg(g) %>% charToRaw %>% rsvg::rsvg_pdf(filename, width = width, height = height)
  },  file='NUL')
 # knitr::include_graphics(filename)
}






# Tab Full

grViz("

digraph FullOld{ 
      
graph [rankdir = LR]

# add node statements

node [shape = rectangle,
fixedsize = true,
width = 1.8]

node[color = brown]
Report

node[color = deepskyblue]
hydro

node[color = purple]
M1 [label = 'MapPlot']
Tr3 [label = 'Tributary']
RB3 [label = 'Reservoir Bacteria']
RC3 [label = 'Reservoir Chemical']
Q1 [label = 'Quabbin'] 
WR1 [label = 'Ware River']
W1 [label = 'Wachusett']
A1 [label = 'All Tribs']
W2 [label = 'Wachusett']
Q2 [label = 'Quabbin'] 
W3 [label = 'Wachusett']

node[color = darkgreen]
R1 [label = 'Reservoir']
RB1 [label = 'Bacteria']
RC1 [label = 'Chemical']
RP1 [label = 'Profile']
RBio1 [label = 'Biological']
Ti2 [label = 'Time-Series']
Ti3 [label = 'Time-Series']
Co2 [label = 'Correlation']
Co3 [label = 'Correlation']
Me2 [label = 'MetaData']
Me3 [label = 'MetaData']
Me4 [label = 'MetaData']
Line
HeatMap
Phytoplankton
Summary

node[color = blue]
Tr1 [label = 'Tributary']
Tr1a [label = '']
Ti1 [label = 'Time-Series']
Co1 [label = 'Correlation']
Me1 [label = 'MetaData']

node[color = red]
F1 [label = 'Filter']
WQ1 [label = 'Water Quality']
Hy2 [label = 'Hydrology']
Tr2 [label = 'Tributary']
RB2 [label = 'Reservoir Bacteria']
RC2 [label = 'Reservoir Chemical']
RP2 [label = 'Reservoir Profile']
Hydrology

node[color = orange]
H1 [label = 'Home']

# add edge statements
M1 -> Tr3 -> Q1
Tr3 -> WR1
Tr3 -> W1
Tr3 -> A1
M1 -> RB3 -> W2
M1 -> RC3 -> Q2
RC3 -> W3

R1 -> RB1 -> Ti2
RB1 -> Co2
RB1 -> Me2
R1 -> RC1 -> Ti3
RC1 -> Co3
RC1 -> Me3
R1 -> RP1 -> HeatMap
RP1 -> Line
RP1 -> Summary
RP1 -> Me4
R1 -> RBio1 -> Phytoplankton

Tr1 -> Tr1a -> Ti1
Tr1a -> Co1
Tr1a -> Me1

F1 -> WQ1 -> Tr2
WQ1 -> RB2
WQ1 -> RC2
WQ1 -> RP2
F1 -> Hy2 -> Hydrology


}
")





grViz("
      digraph App { 
      
      graph [rankdir = LR]
      
      # add node statements

      node [shape = oval, fixedsize = true, width = 1.8, penwidth = 1.5]
      App

      node[shape = rectangle, color = orange]
      H1 [label = 'Home']

      node[color = red]
      F1 [label = 'Filter']

      node[color = darkgreen]
      Tr1 [label = 'Tributary']

      
      node[color = blue]
      R1 [label = 'Reservoir']


      node[color = purple]
      M1 [label = 'MapPlot']


      node[color = deepskyblue]
      Hydro
      
      node[color = brown]
      Report
      
      # add edge statements
      edge[penwidth = 1.5]
      App -> {Report M1 Hydro M1 R1 Tr1 F1 H1}
      
      }
      ")





#################################################
# Tabs


grViz("

      digraph Filter { 
      
      graph [rankdir = LR]
      
      # add node statements

      node[shape = none]
      WQ1 [label = 'Water Quality']
      Hy2 [label = 'Hydrology']
      
      node [shape = rectangle, fixedsize = true, width = 1.8, color = red, penwidth = 1.5]
      F1 [label = 'Filter']
      Tr2 [label = 'Tributary']
      RB2 [label = 'Reservoir Bacteria']
      RC2 [label = 'Reservoir Chemical']
      RP2 [label = 'Reservoir Profile']
      Hydrology

      node[shape = oval]
      FW1 [label = 'Filter-WQ']
      FW2 [label = 'Filter-WQ']
      FW3 [label = 'Filter-WQ']
      FW4 [label = 'Filter-WQ']
      FH [label = 'Filter-Hydro']
      

      # add edge statements
      edge [arrowhead = none, penwidth = 1.5]
      F1 -> WQ1 -> Tr2 -> FW1
      WQ1 -> RB2 -> FW2
      WQ1 -> RC2 -> FW3
      WQ1 -> RP2 -> FW4
      F1 -> Hy2 -> Hydrology -> FH
      
      
      }
      ")




pdf_digraph("TribTab.pdf", "
            
            graph [rankdir = LR]
            
            # add node statements
            
            node [shape = rectangle, fixedsize = true, width = 1.8, color = darkgreen, penwidth = 1.5]
            
            Tr1 [label = 'Tributary']
            Ti1 [label = 'Time-Series']
            Co1 [label = 'Correlation']
            Me1 [label = 'MetaData']
            Q1 [label = 'Quabbin']
            WR1 [label = 'Ware River']
            W1 [label = 'Wachusett']
            Q2 [label = 'Quabbin']
            WR2 [label = 'Ware River']
            W2 [label = 'Wachusett']
            QW3 [label = 'Quabbin and Ware']
            W3 [label = 'Wachusett']
            
            node[shape = oval]
            T1 [label = 'Time']
            T2 [label = 'Time']
            T3 [label = 'Time']
            C1 [label = 'Correlation']
            C2 [label = 'Correlation']
            C3 [label = 'Correlation']
            M1 [label = 'Metadata']
            M2 [label = 'Metadata']
            
            node[color = red]
            FW1 [label = 'Filter-WQ']
            
            node[shape = rectangle]
            Tr2 [label = 'Tributary']
            
            
            # add edge statements
            edge [arrowhead = none, penwidth = 1.5]
            
            Tr1 -> Ti1 -> {Q1 WR1 W1}
            Q1 -> T1
            WR1 -> T2
            W1 -> T3
            
            Tr1 -> Co1 -> {Q2 WR2 W2}
            Q2 -> C1
            WR2 -> C2
            W2 -> C3
            
            Tr1 -> Me1 -> {QW3 W3}
            QW3 -> M1
            W3 -> M2
            
            FW1 -> Tr2
            
            edge [dir = back, style = dotted]
            {T1 T2 T3 C1 C2 C3} -> FW1
            
")






pdf_digraph("ResTab.pdf", "

            graph [rankdir = LR]
            
            # add node statements
            
            node[shape = none]
            RB1 [label = 'Bacteria']
            RC1 [label = 'Chemical']
            RP1 [label = 'Profile']
            RBio1 [label = 'Biological']
            
            node [shape = rectangle, fixedsize = true, width = 1.8, color = blue, penwidth = 1.5]
            R1 [label = 'Reservoir']
            Ti1 [label = 'Time-Series']
            Ti2 [label = 'Time-Series']
            Co1 [label = 'Correlation']
            Co2 [label = 'Correlation']
            Me1 [label = 'MetaData']
            Me2 [label = 'MetaData']
            LP [label = 'Line Plot']
            HM [label = 'Heat Map']
            Me3 [label = 'MetaData']
            Summary [label = 'Table and Summary ']
            Phytoplankton
            W1 [label = 'Wachusett']
            W2 [label = 'Wachusett']
            W3 [label = 'Wachusett']
            Q4 [label = 'Quabbin']
            W4 [label = 'Wachusett']
            Q5 [label = 'Quabbin']
            W5 [label = 'Wachusett']
            Q6 [label = 'Quabbin']
            W6 [label = 'Wachusett']
            Q7 [label = 'Quabbin']
            W7 [label = 'Wachusett']
            Q8 [label = 'Quabbin']
            W8 [label = 'Wachusett']
            Q9 [label = 'Quabbin']
            W9 [label = 'Wachusett']
            Q10 [label = 'Quabbin']
            W10 [label = 'Wachusett']
            W11 [label = 'Wachusett']
            
            node[shape = oval]
            T1 [label = 'Time']
            C1 [label = 'Correlation']
            M1 [label = 'Metadata']
            TD1 [label = 'Time-Depth']
            TD2 [label = 'Time-Depth']
            CD1 [label = 'Correlation-Depth']
            CD2 [label = 'Correlation-Depth']
            M2 [label = 'Metadata']
            M3 [label = 'Metadata']
            PH1 [label = 'Profile-Heatmap']
            PH2 [label = 'Profile-Heatmap']
            M4 [label = 'Metadata']
            M5 [label = 'Metadata']
            PS1 [label = 'Profile-Summary']
            PS2 [label = 'Profile-Summary']
            PL1 [label = 'Profile-Line']
            PL2 [label = 'Profile-Line']
            Phyto
            
            node[color = red]
            FW1 [label = 'Filter-WQ']
            FW2 [label = 'Filter-WQ']
            FW3 [label = 'Filter-WQ']
            FW4 [label = 'Filter-WQ']
            
            node[shape = rectangle]
            RB2 [label = 'Reservoir Bacteria']
            RC2 [label = 'Reservoir Chemical']
            RP2 [label = 'Reservoir Profile']
            RBio2 [label = 'Reservoir Biological']
            
            # add edge statements
            
            edge [arrowhead = none, penwidth = 1.5]
            
            # Bacteria
            R1 -> RB1 -> Ti1 -> W1 -> T1
            RB1 -> Co1 -> W2 -> C1
            RB1 -> Me1 -> W3 -> M1
            
            # Chemical
            R1 -> RC1 -> Ti2 -> Q4 -> TD1
            Ti2 -> W4 -> TD2
            RC1 -> Co2 -> Q5 -> CD1
            Co2 -> W5 -> CD2
            RC1 -> Me2 -> Q6 -> M2
            Me2 -> W6 -> M3
            
            # Profile
            R1 -> RP1 -> HM -> Q7 -> PH1
            HM -> W7 -> PH2
            RP1 -> LP -> Q8 -> PL1
            LP -> W8 -> PL2
            RP1 -> Summary -> Q9 -> PS1
            Summary -> W9 -> PS2
            RP1 -> Me3 -> Q10 -> M4
            Me3 -> W10 -> M5
            
            # Bio
            R1 -> RBio1 -> Phytoplankton -> W11 -> Phyto
            
            FW1 -> RB2
            FW2 -> RC2
            FW3 -> RP2
            FW4 -> RBio2
            
            edge [dir = back, style = dotted, arrowtail = vee]
            {T1 C1} -> FW1
            {TD1 TD2 CD1 CD2} -> FW2
            {PH1 PH2 PL1 PL2 PS1 PS2} -> FW3
            Phyto -> FW4
            
            ")





pdf_digraph("MapPlotTab.pdf", "

            graph [rankdir = LR]
            
            # add node statements
            
            node[shape = none]
            Tr3 [label = 'Tributary']
            RB3 [label = 'Reservoir Bacteria']
            RC3 [label = 'Reservoir Chemical']
            
            node [shape = rectangle, fixedsize = true, width = 1.8, color = purple, penwidth = 1.5]
            M1 [label = 'MapPlot']
            Q1 [label = 'Quabbin'] 
            WR1 [label = 'Ware River']
            W1 [label = 'Wachusett']
            A1 [label = 'All Tribs']
            W2 [label = 'Wachusett']
            Q3 [label = 'Quabbin'] 
            W3 [label = 'Wachusett']
            
            node[shape = oval] 
            Mm1 [label = 'MapPlot']
            Mm2 [label = 'MapPlot']
            Mm3 [label = 'MapPlot']
            Mm4 [label = 'MapPlot']
            Mm5 [label = 'MapPlot']
            Mm6 [label = 'MapPlot']
            Mm7 [label = 'MapPlot']
            
            node[color = red]
            FW1 [label = 'Filter-WQ']
            FW2 [label = 'Filter-WQ']
            FW3 [label = 'Filter-WQ']
            
            node[shape = rectangle]
            Tr2 [label = 'Tributary']
            RB2 [label = 'Reservoir Bacteria']
            RC2 [label = 'Reservoir Chemical']
            
            # add edge statements
            
            edge [arrowhead = none, penwidth = 1.5]
            M1 -> Tr3 -> Q1 -> Mm1
            Tr3 -> WR1 -> Mm2
            Tr3 -> W1 -> Mm3
            Tr3 -> A1 -> Mm4
            
            M1 -> RB3 -> W2 -> Mm5
            
            M1 -> RC3 -> Q3 -> Mm6
            RC3 -> W3 -> Mm7
            
            FW1 -> Tr2
            FW2 -> RB2
            FW3 -> RC2
            
            edge [dir = back, style = dotted, arrowtail = vee]
            {Mm1 Mm2 Mm3 Mm4} -> FW1
            {Mm5} -> FW2
            {Mm6 Mm7} -> FW3
            
            ")



##################################################
# All Scripts -  Modules, Functions, Sources

pdf_digraph("diaModuls.pdf", "

      digraph ScriptNoTab { 
      
      graph [rankdir = LR, ranksep = 1.5]
      
      # add node statements
      node [shape = polygon, sides = 10, fixedsize = true, width = 2, penwidth = 1.5]
      GetSeasons; PhytoPlot

      node [shape = hexagon]
      App

      node [shape = polygon, sides = 8]
      LoadMSAccess

      node [shape = oval]
      
      # add edge statements
      rank = same; Home; Filter; ProfileTableStat
      
      edge [dir = both, arrowtail = vee, arrowhead = vee, penwidth = 1.5] 
      
      Time-> {SiteSelection ParamSelect DateSelect}
      Correlation -> {SiteSelection ParamSelect DateSelect}
      TimeDepth -> {StationLevelSelection ParamSelect DateSelect}
      CorrelationDepth -> {StationLevelSelection ParamSelect DateSelect}
      
      {SiteSelection StationLevelSelection} -> CheckboxSelectAll
      ParamSelect -> SelectInputSelectAll

      Filter -> {CheckboxSelectAll SelectInputSelectAll}

      Phyto -> PhytoPlot

      edge [dir = front]
      App -> {Home Filter Time TimeDepth Correlation CorrelationDepth ProfileHeatmap ProfileLine Phyto MapPlot Report LoadMSAccess ProfileTableStat}
      Time-> {SiteMap PlotTime Summary}
      Correlation -> {SiteMap PlotCorr Summary}
      TimeDepth -> {SiteMap PlotTimeDepth SummaryDepth}
      CorrelationDepth -> {SiteMap PlotCorrDepth SummaryDepth}

      edge [arrowhead = none]
      {Summary SummaryDepth} -> GetSeasons

      ")

rank = same; SiteMap; PlotTime; Summary; PhytoPlot
rank = same; GetSeasons; CheckboxSelectAll; SelectInputSelectAll


# Module1's


pdf_digraph("Home.pdf", width = 250 , "
      
            graph [rankdir = LR, ranksep = 1.5]
            
            # add node statements
            
            node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
            
            # add edge statements
            
            edge [arrowhead = vee, penwidth = 1.5]
            App -> {Home [penwidth = 2.5, fontname = 'times-bold', width = 2.5]}
            
            ")

pdf_digraph("Filter.pdf", width = 250 , "
      
            graph [rankdir = LR, ranksep = 1.5]
            
            # add node statements
            node [shape = hexagon, fixedsize = true, width = 2, penwidth = 1.5]
            App
            
            node [shape = oval]
            
            # add edge statements
            
            edge [dir = both, arrowtail = vee, arrowhead = vee, penwidth = 1.5] 
            
            Filter -> {CheckboxSelectAll SelectInputSelectAll}
            
            edge [dir = front]
            App -> {Filter}
            
            ")



pdf_digraph("Time.pdf", width = 350 , "

      graph [rankdir = LR, ranksep = 1.5]
      
      # add node statements
      
      node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
      
      # add edge statements
      
      edge [dir = both, arrowtail = vee, arrowhead = vee, penwidth = 1.5] 
      {Time [penwidth = 2.5, fontname = 'times-bold', width = 2.5]} -> {SiteSelection ParamSelect DateSelect}

      edge [dir = front]
      Time-> {SiteMap PlotTime StatTime}
      App -> Time
")



pdf_digraph("Corr.pdf", width = 350 , "
      
      graph [rankdir = LR, ranksep = 1.5]
      
      # add node statements
      
      node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
      
      # add edge statements
      
      edge [dir = both, arrowtail = vee, arrowhead = vee, penwidth = 1.5] 
      {Corr [penwidth = 2.5, fontname = 'times-bold', width = 2.5]} -> {SiteSelection ParamSelect DateSelect}
      
      edge [dir = front]
      Corr -> {SiteMap PlotCorr StatCorr}
      App -> Corr

")



pdf_digraph("TimeDep.pdf", width = 350 , "
      
            graph [rankdir = LR, ranksep = 1.5]
            
            # add node statements
            
            node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
            
            # add edge statements
            
            edge [dir = both, arrowtail = vee, arrowhead = vee, penwidth = 1.5]
            {TimeDepth [penwidth = 2.5, fontname = 'times-bold', width = 2.5]} -> {StationLevelCheckbox ParamSelect DateSelect}
            
            edge [dir = front]
            TimeDepth -> {SiteMap PlotTimeDepth StatTimeDepth}
            App -> TimeDepth
            
            ")


pdf_digraph("CorrDep.pdf", width = 350 , "
      
            graph [rankdir = LR, ranksep = 1.5]
            
            # add node statements
            
            node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
            
            # add edge statements
            
            edge [dir = both, arrowtail = vee, arrowhead = vee, penwidth = 1.5] 
            {CorrelationDepth [penwidth = 2.5, fontname = 'times-bold', width = 2.5]} -> {StationLevelCheckbox ParamSelect DateSelect}
            
            edge [dir = front]
            Corr -> {SiteMap PlotCorrDepth StatCorr}
            App -> CorrDepth
            
            ")







pdf_digraph("ProfileLine.pdf", width = 250 , "
      
            graph [rankdir = LR, ranksep = 1.5]
            
            # add node statements
            
            node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
            
            # add edge statements
            
            edge [arrowhead = vee, penwidth = 1.5]
            App -> {ProfileLine [penwidth = 2.5, fontname = 'times-bold', width = 2.5]}
            
            ")


pdf_digraph("ProfileHeatmap.pdf", width = 250 , "
      
            graph [rankdir = LR, ranksep = 1.5]
            
            # add node statements
            
            node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
            
            # add edge statements
            
            edge [arrowhead = vee, penwidth = 1.5]
            App -> {ProfileHeatmap [penwidth = 2.5, fontname = 'times-bold', width = 2.5]}
            
            ")

pdf_digraph("ProfileTableStat.pdf", width = 350 , "
      
            graph [rankdir = LR, ranksep = 1.5]
            
            # add node statements
            
            node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
            
            # add edge statements
            
            edge [dir = both, arrowtail = vee, arrowhead = vee, penwidth = 1.5] 
            ProfileTableStat -> {checkboxSelectAll ParamSelect DateSelect}
            
            edge [dir = front]
            App -> {ProfileTableStat [penwidth = 2.5, fontname = 'times-bold', width = 2.5]}
            
            edge [arrowhead = none]
            ProfileTableStat -> {GetSeasons [shape = octagon]}
            
            ")


pdf_digraph("Phyto.pdf", width = 350 , "
      
      graph [rankdir = LR, ranksep = 1.5]
      
      # add node statements

      node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
      
      # add edge statements
      
      edge [dir = both, arrowtail = vee, arrowhead = vee, penwidth = 1.5]
      Phyto -> {PhytoPlot [shape = octagon]}
      
      edge [dir = front]
      App -> {Phyto [penwidth = 2.5, fontname = 'times-bold', width = 2.5]}

")


pdf_digraph("MapPlot.pdf", width = 350 , "
      
            graph [rankdir = LR, ranksep = 1.5]
            
            # add node statements
            
            node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
            
            # add edge statements
            
            edge [dir = both, arrowtail = vee, arrowhead = vee, penwidth = 1.5]
            MapPlot -> {CircleSizeLegend [shape = octagon]}
            
            edge [dir = front]
            App -> {MapPlot [penwidth = 2.5, fontname = 'times-bold', width = 2.5]}
            ")

pdf_digraph("Report.pdf", width = 350 , "
      
      graph [rankdir = LR, ranksep = 1.5]
      
      # add node statements
      
      node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
      
      # add edge statements
      
      edge [arrowhead = vee, penwidth = 1.5]
      App -> {Report [penwidth = 2.5, fontname = 'times-bold', width = 2.5]}

")

#### Module 2's inputs

pdf_digraph("SiteSelection.pdf", width = 350 , "
      
            graph [rankdir = LR, ranksep = 1.5]
            
            # add node statements
            
            node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
            
            # add edge statements
            
            edge [dir = both, arrowtail = vee, arrowhead = vee, penwidth = 1.5]
            {Time Correlation} -> {SiteSelection [penwidth = 2.5, fontname = 'times-bold', width = 2.5]}
            SiteSelection -> CheckboxSelectAll
            
            ")


pdf_digraph("StationLevelCheckbox.pdf", width = 350 , "
      
      graph [rankdir = LR, ranksep = 1.5]
      
      # add node statements
      
      node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
      
      # add edge statements
      
      edge [dir = both, arrowtail = vee, arrowhead = vee, penwidth = 1.5]
      {TimeDepth CorrelationDepth} -> {StationLevelCheckbox [penwidth = 2.5, fontname = 'times-bold', width = 2.5]}
      StationLevelCheckbox -> CheckboxSelectAll

")


pdf_digraph("ParamSelect.pdf", width = 350 , "
      
      graph [rankdir = LR, ranksep = 1.5]
      
      # add node statements
      
      node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
      
      # add edge statements
      
      edge [dir = both, arrowtail = vee, arrowhead = vee, penwidth = 1.5] 
      {Time Correlation TimeDepth CorrelationDepth ProfileLine ProfileSummary} -> {ParamSelect [penwidth = 2.5, fontname = 'times-bold', width = 2.5]}
      ParamSelect -> SelectInputSelectAll

")


pdf_digraph("ParamCheckbox.pdf", width = 350 , "
      
            graph [rankdir = LR, ranksep = 1.5]
            
            # add node statements
            
            node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
            
            # add edge statements
            
            edge [dir = both, arrowtail = vee, arrowhead = vee, penwidth = 1.5] 
            {ProfileLine ProfileSummary} -> {ParamCheckbox [penwidth = 2.5, fontname = 'times-bold', width = 2.5]}
            ParamCheckbox -> checkboxSelectAll
            
            ")


pdf_digraph("DateSelect.pdf", width = 350 , "
      
            graph [rankdir = LR, ranksep = 1.5]
            
            # add node statements
            
            node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
            
            # add edge statements
            
            edge [dir = both, arrowtail = vee, arrowhead = vee, penwidth = 1.5] 
            {Time Correlation TimeDepth CorrelationDepth ProfileLine ProfileSummary} -> {DateSelect [penwidth = 2.5, fontname = 'times-bold', width = 2.5]}
            
            ")


pdf_digraph("checkboxSelectAll.pdf", width = 350 , "
      
            graph [rankdir = LR, ranksep = 1.5]
            
            # add node statements
            
            node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
            
            # add edge statements
            
            edge [dir = both, arrowtail = vee, arrowhead = vee, penwidth = 1.5] 
            {Filter SiteSelect} -> {checkboxSelectAll [penwidth = 2.5, fontname = 'times-bold', width = 2.5]}
            
            ")


pdf_digraph("SelectInputSelectAll.pdf", width = 350 , "
      
            graph [rankdir = LR, ranksep = 1.5]
            
            # add node statements
            
            node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
            
            # add edge statements
            
            edge [dir = both, arrowtail = vee, arrowhead = vee, penwidth = 1.5] 
            {Filter ParamSelect StationLevelSelect} -> {SelectInputSelectAll [penwidth = 2.5, fontname = 'times-bold', width = 2.5]}
")

### module2's out

pdf_digraph("PlotTime.pdf", width = 350 , "
      
            graph [rankdir = LR, ranksep = 1.5]
            
            # add node statements
            
            node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
            
            # add edge statements
            
            edge [arrowhead = vee, penwidth = 1.5]
            Time -> {PlotTime [penwidth = 2.5, fontname = 'times-bold', width = 2.5]}
            
            ")


pdf_digraph("PlotCorr.pdf", width = 350 , "
      
      graph [rankdir = LR, ranksep = 1.5]
      
      # add node statements
      
      node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
      
      # add edge statements
      
      edge [arrowhead = vee, penwidth = 1.5]
      Correlation -> {PlotCorr [penwidth = 2.5, fontname = 'times-bold', width = 2.5]}

")

pdf_digraph("PlotTimeDepth.pdf", width = 350 , "
      
      graph [rankdir = LR, ranksep = 1.5]
      
      # add node statements
      
      node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
      
      # add edge statements
      
      edge [arrowhead = vee, penwidth = 1.5]
      TimeDepth -> {PlotTimeDepth [penwidth = 2.5, fontname = 'times-bold', width = 2.5]}

")



pdf_digraph("PlotCorrDepth.pdf", width = 350 , "
      
            graph [rankdir = LR, ranksep = 1.5]
            
            # add node statements
            
            node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
            
            # add edge statements
            
            edge [arrowhead = vee, penwidth = 1.5]
            CorrelationDepth -> {PlotCorrDepth [penwidth = 2.5, fontname = 'times-bold', width = 2.5]}
            
            ")



pdf_digraph("Summary.pdf", width = 350 , "
      
            graph [rankdir = LR, ranksep = 1.5]
            
            # add node statements
            
            node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
            
            # add edge statements
            
            edge [arrowhead = vee, penwidth = 1.5]
            {Time Correlation} -> {Summary [penwidth = 2.5, fontname = 'times-bold', width = 2.5]}
            
            ")


pdf_digraph("SummaryDepth.pdf", width = 350 , "
      
      graph [rankdir = LR, ranksep = 1.5]
      
      # add node statements
      
      node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
      
      # add edge statements
      
      edge [arrowhead = vee, penwidth = 1.5]
      {TimeDepth CorrelationDepth} -> {SummaryDepth [penwidth = 2.5, fontname = 'times-bold', width = 2.5]}
      

")


pdf_digraph("SiteMap.pdf", width = 350 , "
      
      graph [rankdir = LR, ranksep = 1.5]
      
      # add node statements
      
      node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
      
      # add edge statements
      
      edge [arrowhead = vee, penwidth = 1.5]
      {Time Correlation TimeDepth CorrelationDepth} -> {SiteMap [penwidth = 2.5, fontname = 'times-bold', width = 2.5]}

")


# functions


grViz("
      digraph SiteMap { 
      
      graph [rankdir = LR, ranksep = 1.5]
      
      # add node statements
      
      node [shape = oval, fixedsize = true, width = 2, penwidth = 1.5]
      
      # add edge statements
      
      edge [arrowhead = vee, penwidth = 1.5]
      {Time Correlation TimeDepth CorrelationDepth} -> {SiteMap [penwidth = 2.5, fontname = 'times-bold', width = 2.5]}
      
      }
      ")

