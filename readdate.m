
%test read data

run setup_lab_hover

load_system('s_hover');
set_param('s_hover','SimulationCommand','Start');

angle = 's_hover/3DOF HOVER Model';
rto = get_param(angle, 'RuntimeObject');

time = rto.OutputPort(2).Data;