clear all

run setup_lab_hover1
open('s_hover1.mdl');
sim('s_hover1');

%matlab -nojvm -nodesktop -nodisplay -r test