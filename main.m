clear all

run setup_lab_hover
open('s_hover.mdl');
sim('s_hover');

%matlab -nojvm -nodesktop -nodisplay -r test