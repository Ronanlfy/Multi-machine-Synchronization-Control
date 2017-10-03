%% Load sample data from MAT files
% rm: Comment these lines out if you want to use the data recently stored in
% the Matlab workspace (from the QUARC controller).
% 
% load('sample_data_yaw.mat');
% load('sample_data_pitch.mat');
% load('sample_data_roll.mat');
% load('sample_data_Vb.mat');
% load('sample_data_Vf.mat');
% load('sample_data_Vr.mat');
% load('sample_data_Vl.mat');
%
%% Setup variables
% Load from variables set in workspace after running a Simulink model or
% from the previously saved response saved in the MAT files above.
t = data_yaw(:,1);
% Yaw
th_y_d = data_yaw(:,2);
th_y = data_yaw(:,3);
% Pitch
th_p_d = data_pitch(:,2);
th_p = data_pitch(:,3);
% Roll
th_r_d = data_roll(:,2);
th_r = data_roll(:,3);
% Motor Voltage
Vf = data_Vf(:,2);
Vb = data_Vb(:,2);
Vr = data_Vr(:,2);
Vl = data_Vl(:,2);
%
%% Plot response
figure(1)
subplot(3,1,1);
plot(t,th_y_d,'b:',t,th_y,'r-','linewidth',2);
ylabel('Yaw (deg)');
subplot(3,1,2);
plot(t,th_p_d,'b:',t,th_p,'r-','linewidth',2);
ylabel('Pitch (deg)');
subplot(3,1,3);
plot(t,th_r_d,'b:',t,th_r,'r-','linewidth',2);
ylabel('Roll (deg)');
xlabel('time (s)');
% 
% Motor Voltage in separate figure
figure(2)
subplot(2,2,1);
plot(t,Vf,'r-');
axis([0 20 -5 20]);
ylabel('Front Motor (V)');
% 
subplot(2,2,2);
plot(t,Vb,'r-');
axis([0 20 -5 20]);
ylabel('Back Motor (V)');
% 
subplot(2,2,3);
plot(t,Vr,'r-');
axis([0 20 -5 20]);
ylabel('Right Motor (V)');
xlabel('time (s)');
% 
subplot(2,2,4);
plot(t,Vr,'r-');
axis([0 20 -5 20]);
ylabel('Roll Motor (V)');
xlabel('time (s)');
%
%% Print to high-res PNG
%  rm: comment out if you do not want to export 
% print (1,'-dpng','-r300','rsp_hover.png');
% print (2, '-dpng','-r300','rsp_hover_vm.png');