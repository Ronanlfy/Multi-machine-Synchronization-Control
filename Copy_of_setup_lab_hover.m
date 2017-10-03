%
%% SETUP_LAB_HOVER
%
% 3 DOF HOVER Control Lab: 
% Design of a FF+LQR position controller
% 
% SETUP_LAB_HOVER sets the model parameters and designs the controller
% parameters for the Quanser 3DOF Hover system.
%
% Copyright (C) 2010 Quanser Consulting Inc.
% Quanser Consulting Inc.
%
clear all;
%
%% Amplifier Configuration
% Amplifier gain used for yaw and pitch axes.
K_AMP = 3;
% Amplifier Maximum Output Voltage (V)
VMAX_AMP = 24;
% Digital-to-Analog Maximum Voltage (V): set to 10 for Q4/Q8 cards
VMAX_DAC = 10;
%
%% Filter and Rate Limiter Settings
% Specifications of a second-order low-pass filter
wcf = 2 * pi * 20; % filter cutting frequency
zetaf = 0.6;        % filter damping ratio
%
% Maximum Rate of Desired Position (rad/s)
% Note: This is for both the program and joystick commands.
CMD_RATE_LIMIT = 60 * pi/180; % 60 deg/s converted to rad/s
%
%% Joystick Settings
% Joystick input X sensitivity used for roll (deg/s/V)
K_JOYSTICK_X = -25;
% Joystick input Y sensitivity used for pitch (deg/s/V)
K_JOYSTICK_Y = 25;
% Pitch integrator saturation of joystick (deg)
INT_JOYSTICK_SAT_LOWER = -10;
INT_JOYSTICK_SAT_UPPER = 10;
% Deadzone of joystick: set input ranging from -DZ to +DZ to 0 (V)
JOYSTICK_X_DZ = 0.25;
JOYSTICK_Y_DZ = 0.25;
%
%
%% Set the model parameters of the 3DOF HOVER.
% These parameters are used for model representation and controller design.
[ Kt, Kf, L, Jy, Jp, Jr, g, K_EC_Y , K_EC_P , K_EC_R ] = config_hover();
%
% For the following state vector: X = [ theta; psi; theta_dot; psi_dot]
% Initialization the state-Space representation of the open-loop System
HOVER_ABCD_eqns;

value = 0.1035;
w0_p = 35;
w0_r = 35;
w0_y = 28;
wc_p = w0_p/3;
wc_r = w0_r/3;
wc_y = w0_y/7;
b0_p = value;
b0_r = value;
b0_y = 0.0105;

kd_y = 2 * wc_y;
kd_p = 2 * wc_p;
kd_r = 2 * wc_r;
kp_y = wc_y ^ 2;
kp_p = wc_p ^ 2;
kp_r = wc_r ^ 2;

con = [-1 -1 1 1;1 -1 0 0;0 0 1 -1;1 1 1 1];
con = inv(con);





