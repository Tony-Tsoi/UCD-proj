% EEC281 Project 3 Problem 3a
% Wai Cheong Tsoi 916182685

%% Problem 3a
function [ripple, minpass, maxstoplo, maxstophi] = lpfirstats(H)
    % Takes filter coefficients vector h
    % Returns an array of four values:
    % ripple - ripple of passband below 8MHz
    % minpass - max attenuation of passband below 12MHz
    % maxstoplo - least attenuation of stopband above 18MHz
    % maxstophi - least attenuation of stopband above 25MHz
    
    % frequencies of interest
   	w1 = 8/50; w2 = 12/50; w3 = 18/50; w4 = 25/50;

    w = linspace(0, 1, length(H)); % Get normalized w vector
    
    % Get values of the range of interest
    H1 = H(w < w1); H2 = H(w < w2); H3 = H(w > w3); H4 = H(w > w4);
    
    % Return values
    ripple = db(min(H1)) - db(max(H1));
    minpass = db(min(H2)) - db(max(H2));
    maxstoplo = db(max(H3));
    maxstophi = db(max(H4));
end