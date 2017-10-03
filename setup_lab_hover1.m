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
%
%% Design LQR Controller
% Bias voltage applied to motors (V)
V_bias = 2.0;
% LQR Controller Design Specifications
Q = diag([500 350 350 0 20 20] );
R = 0.01*diag([1 1 1 1]);
% Automatically calculate the LQR controller gain
K = lqr( A, B, Q, R );    
% Display the calculated gains
disp( ' ' )
disp( 'Calculated LQR controller gain elements: ' )
K
