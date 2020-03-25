%% prob1_verif
% Tests the generated inputs and outputs from test bench prob1_tb.vt
% by running the generated file prob1out.m

clear; % Clear variables

% Pre-allocate and Load numbers
a_i = zeros(1, 1000); a_r = zeros(1, 1000);
b_i = zeros(1, 1000); b_r = zeros(1, 1000);
w_i = zeros(1, 1000); w_r = zeros(1, 1000);
x_i = zeros(1, 1000); x_r = zeros(1, 1000);
prob1out; 

% Calculate 
a_i = a_i / 2^14; a_r = a_r / 2^14;
b_i = b_i / 2^14; b_r = b_r / 2^14;
w_i = w_i / 2^14; w_r = w_r / 2^14;
x_i = x_i / 2^12; x_r = x_r / 2^12;
x = a_r + j*a_i + (b_r + j.*b_i).*(w_r + j.*w_i);

% Compare reference by Matlab with Hardware Output
Xin = x_r + j.*x_i;
Xout = x;
difff(Xin, Xout);