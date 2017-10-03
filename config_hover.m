% SETUP_HOVER_CONFIGURATION
%
% SETUP_HOVER_CONFIGURATION sets and returns the model model parameters 
% of the Quanser 3 DOF Hover plant.
%
%
% Copyright (C) 2010 Quanser Consulting Inc.
% Quanser Consulting Inc.
%
%
function [ Kt, Kf, l, Jy, Jp, Jr, g, K_EC_Y , K_EC_P , K_EC_R  ] = config_hover( )
%
% Gravitational Constant (m/s^2)
g = 9.81;
% Motor Armature Resistance (Ohm)
Rm = 0.83;
% Motor Current-Torque Constant (N.m/A)
Kt_m = 0.0182;
% Motor Rotor Moment of Inertia (kg.m^2)
Jm = 1.91e-6;
% Moving Mass of the Hover system (kg)
m_hover = 2.85;
% Mass of each Propeller Section = motor + shield + propeller + body (kg)
m_prop = m_hover / 4;
% Distance between Pivot to each Motor (m)
l = 7.75*0.0254;
% Propeller Force-Thrust Constant found Experimentally (N/V)
Kf = 0.1188;
% Propeller Torque-Thrust Constant found Experimentally (N-m/V)
Kt = 0.0036;
% note: front/back motor are counter-clockwise (negative torque) and 
% left/right motor are clockwise (positive torque).
% 
% Equivalent Moment of Inertia of each Propeller Section (kg.m^2)
Jeq_prop = Jm + m_prop*l^2;
% Equivalent Moment of Inertia about each Axis (kg.m^2)
Jp = 2*Jeq_prop;
Jy = 4*Jeq_prop;
Jr = 2*Jeq_prop;
%
% Pitch and Yaw Axis Encoder Resolution (rad/count)
K_EC_Y = -2 * pi / ( 8 * 1024 );
K_EC_P = 2 * pi / ( 8 * 1024 );
K_EC_R = 2 * pi / ( 8 * 1024 );

% end of setup_hover_configuration()