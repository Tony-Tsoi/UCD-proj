% EEC281 Project 3 Problem 3 (excluding a)
% Wai Cheong Tsoi 916182685

%% Problem 3b
fs = 100e6; % sampling frequency
f = [12e6, 18e6]; % passband stopband frequencies
a = [1, 0]; % ideal amplitude of the bands
dev = [1 - 10^(-3/20), 10^(-25/20)]; % ripples of the bands
[n, fo, ao] = firpmord(f, a, dev, fs); % get specifications

% Final variables
fk = Inf; fpps = Inf; farea = Inf; fcoeffs = [];

for ntaps = n-1:n+9 % Iterate for some length n
    coeffs1 = firpm(ntaps+1, fo, ao); % get the fir filter
    k2 = 1 / min(abs(coeffs1));
    coeffs2 = coeffs1 * k2; % normalize
    
    tk = []; tpp = Inf; % Temporary Variables to be compared with
    
    for scale = 0.1:0.01:5 % Iterate for some scaling factor
        coeffs = round(coeffs2*scale); % Scale and round coeffs
        [H,W]     = freqz(coeffs); % get frequency response
        H_norm    = abs(H) ./ abs(H(1)); % normalize to DC gain = 1
        
        % Get spec and check if this filter work
        [ripple, minpass, maxstoplo, maxstophi] = lpfirstats(H_norm);
        if (ripple >= -3) && (minpass >= -4)
            if (maxstoplo <= -21) && (maxstophi <= -25)
                % if it works, check if least pp terms 
                pp = gettotalpp(coeffs);
                if pp < tpp
                    tpp = pp;
                    tk = scale;
                end
            end
        end
    end
    
    if tpp < Inf % If there is solution for this length
        area = tpp + 2*ntaps; % Get area
        if area < farea % If area smaller than other lengths, make final
            fk = tk * k2; farea = area; fpps = tpp;
            fcoeffs = round(tk * coeffs2);
        end
    end
end

% Print results and plot
ftaps = length(fcoeffs);



%% Problem 3c

% Get specifications for smallest area filter
H = freqz(fcoeffs);
H_norm = abs(H) ./ abs(H(1));
[ripple, minpass, maxstoplo, maxstophi] = lpfirstats(H_norm);

% Print Filter Coefficients
fprintf("Filter Coefficients = [");
for i = 1:length(fcoeffs)
    fprintf("%i ", fcoeffs(i));
end
fprintf("]\n");

% Print number of taps and area estimate
fprintf("Number of taps = %i\n", ftaps);
fprintf("Area estimate = %i\n", farea);
fprintf("Below 8MHz: %.2fdB ripple\n", ripple);
fprintf("Below 12MHz: %.2fdB attenuation\n", minpass);
fprintf("Above 18MHz: %.2fdB attenuation\n", maxstoplo);
fprintf("Above 25MHz: %.2fdB attenuation\n", maxstophi);

% Frequency Response plot
plot_one_lpfir(fcoeffs);

% Impulse Response plot
figure; stem(0:length(fcoeffs)-1, fcoeffs);
title('Impulse Response');

%% Problem 3d
fileID = fopen('coeffs.m', 'w');
fprintf(fileID, "%% coeffs.m\n");
fprintf(fileID, "coeffs = [");
for i = 1:length(fcoeffs)-1
    fprintf(fileID, "%i ", fcoeffs(i));
end
fprintf(fileID, "%i];", fcoeffs(end));
fclose(fileID);