close all
2dlabels delete *
2dlabels adelete *
2dlabels change * visibility hide
2dlabels change * visibility show

open 6eqe

sel #0:160.a@ca #0:206.a@ca #0:237.a@ca  #0:159.a@ca #0:238.a@ca #0:159.a@ca #0:214.a@ca
writesel ~/Ramapo/ProteinStructure/Chimera_Scripts/6eqe_sel_.txt namingStyle command itemtype atom

#Restrict view to within 10A and #0:237.a@cg
~disp #0:237.a@cg za>5
color magenta #0:

# Width of Active Site Cleft
# color yellow #0:88.a,238.a

# Catalytic Triad - His237, Ser160, and Asp206
alias Triad #0:160,237,206.a

#Petase Disulfide Bridge #0 6eqe
alias Disul #0:203,239.a

#Other changes H->W159 F->S238 H->S214 
alias OtherC #0:159,214,238.a


disp #0:160,206,237.a
disp #0:203,239.a
disp #0:159,214,238.a

color blue #0:160,206,237.a
color gold #0:203,239.a


matrixget ~/Ramapo/ProteinStructure/Chimera_Scripts/6eqe.mat
2dlabel create 1 text "PETase 6eqe" color magenta ypos 0.88 xpos .23 size 48

#2dlabels acreate name  start x1,y1  end x2,y2 [ color arrow-color ] [ weight weight ] [ head blocky | solid | pointy | pointer ] [ visibility hide | show ]
#2dlabels acreate a1 start .55,.25 end .5,.35 color tan weight 0.5 head solid
#2dlabels acreate a2 start .55,.25 end .6,.35 color lightblue weight 0.5 head pointer

color gold Disul
color green OtherC
color red Triad

rlabel Disul
rlabel Triad
rlabel OtherC

focus
