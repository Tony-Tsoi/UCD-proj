%% EEC264 Project
% Author: Wai Cheong Tsoi

% Note that the run time of this script is very long.
% Figure 1 - around 60s
% Figure 2 - around 60s
% Figure 3 - around 300s
% Total    - around 7 minutes

%% Figure 1 - Fig. 4
clear;

% Parameters
T = 1e-3;
M = 60;
Aprime = 2.78e-7;
Nmin = 4; Nmax = 150;
rhodb = [0, -4, -8];

% Equations
ln = @log;

rho = db2pow(rhodb);
A = Aprime *M*T;
N = Nmin:Nmax;
gamma = @(N) -ln(A.*N);

NTrials = 1e4;
rng('default');

DR = zeros(length(rho), length(N));

for k = 1:length(rho)
    % Detector Simulation
    Ndet = zeros(1, length(N)); % Number of detections
    
    sn = (randn(NTrials, 1) + i*randn(NTrials, 1)) * sqrt(rho(k)/2);
    sn = sn * ones(1, Nmax);
    wn = (randn(NTrials, Nmax) + i*randn(NTrials, Nmax)) * sqrt(1/2);
    rn = sn + wn;

    for n = N
        A = 1/n*abs(sum(rn(:, 1:n)')).^2;
        deltaN = A > gamma(n);
        Ndet(n-Nmin+1) = sum(deltaN);
    end

    DR(k, :) = Ndet ./NTrials ./M./N./T;
end

[DR1m, N1] = max(DR(1, :)); N1 = N1 + Nmin - 1;
[DR2m, N2] = max(DR(2, :)); N2 = N2 + Nmin - 1;
[DR3m, N3] = max(DR(3, :)); N3 = N3 + Nmin - 1;


% Plot
figure(1); clf; hold on;
plot(N, DR(1, :), N, DR(2, :), N, DR(3, :));
plot(N1, DR1m, 'bo', N2, DR2m, 'bo', N3, DR3m, 'bo');
xlabel('N'); ylabel('DR [det/s]');
axis([0 150 0 0.5]); hold off;
legend('\rho =   0 dB', '\rho = -4 dB', '\rho = -8 dB');

%% Figure 2 - Fig. 9
clear;

% Parameters
T = 1e-3;
M = 60;
Aprime = 5e-7;
L = 15;
rhodb = [0, -4, -8];
Nmin = 4; Nmax = 150;
NTrials = 1e4;
rng('default');

% Equations
rho = db2pow(rhodb);
N = Nmin:Nmax;
A = Aprime *M*T;
gamma = @(N) L*((A.*N).^(-1/L)-1);

% For each SNR per data sample
DR = zeros(length(rho), length(N));
for k = 1:length(rho)
    numdet = zeros(1, length(N)); % Number of detections
    
    % Signals of Nmax by NTrials matrices
    sn = (randn(NTrials,1) + i*randn(NTrials,1)).* sqrt(1/2) * ones(1, Nmax);
    wn = (randn(NTrials, Nmax) + i*randn(NTrials, Nmax)) * sqrt(1/2/rho(k));
    wl = (randn(NTrials, L) + i*randn(NTrials, L)) * sqrt(1/2/rho(k));
    rn = sn + wn;
    
    for n = N
        % For each n in set of Nmin:Nmax
        % Extract n samples and send it to LRT
        A = 1/n*abs(sum(rn(:, 1:n)')).^2;
        B = 1/L*sum(abs(wl').^2);

        % Compare with the computed threshold gamma
        deltaN = A./B > gamma(n);

        % Number of detection would be number of 1s after the comparison
        numdet(n-Nmin+1) = sum(deltaN);
    end

    % Detection Rate
    DR(k, :) = numdet ./NTrials./M./N./T;
end

[DR1m, N1] = max(DR(1, :)); N1 = N1 + Nmin - 1;
[DR2m, N2] = max(DR(2, :)); N2 = N2 + Nmin - 1;
[DR3m, N3] = max(DR(3, :)); N3 = N3 + Nmin - 1;


% Plot
figure(2); clf; hold on;
plot(N, DR);
plot(N1, DR1m, 'bo', N2, DR2m, 'bo', N3, DR3m, 'bo');
xlabel('N'); ylabel('DR [det/s]');
axis([0 150 0 .5]); hold off;
legend('\rho =   0 dB', '\rho = -4 dB', '\rho = -8 dB');

%% Figure 3
clear;

% Parameters
T = 1e-3;
M = 60;
Aprime1 = 5e-7;
Nmin = 4; Nmax = 150;
rhodb = [0, -4, -8];
NTrials = 3e3;
rng('default');

% Equations
ln = @log;

rho = db2pow(rhodb);
A1 = Aprime1 *M*T;
N = Nmin:Nmax;
gamma = @(N) -ln(1-(1-A1*N).^(1./N));
DR = zeros(length(rho), length(N));

% Calculation
v = 0:1/Nmax:(Nmax-1)/Nmax;
E = exp(-i*2*pi*v); % 1 x length(v) row array

for k = 1:length(rho)
    % Detector Simulation
    numdetot = zeros(1, length(N)); % Number of detections

    for n = N
        numdet = 0;
        v = 0:1/n:(n-1)/n;
        E = exp(-i*2*pi*v);
        
        sn = (randn(NTrials, 1) + i*randn(NTrials, 1)) * sqrt(rho(k)/2);
        sn = sn * ones(1, Nmax);
        wn = (randn(NTrials, Nmax) + i*randn(NTrials, Nmax)) * sqrt(1/2);
        rn = sn + wn;
        
        for t = 1:NTrials
            rnt = rn(t, 1:n)' * E;
            A = abs(sum(rnt)).^2;
            B = max(A);
            deltaN = B/n > gamma(n);
            numdet = numdet + deltaN;
        end
        numdetot(n-Nmin+1) = numdet;
    end

    DR(k, :) = numdetot ./NTrials./M./N./T;
end

[DR1m, N1] = max(DR(1, :)); N1 = N1 + Nmin - 1;
[DR2m, N2] = max(DR(2, :)); N2 = N2 + Nmin - 1;
[DR3m, N3] = max(DR(3, :)); N3 = N3 + Nmin - 1;

% Plot
figure(3); clf; hold on;
plot(N, DR(1, :), N, DR(2, :), N, DR(3, :));
plot(N1, DR1m, 'bo', N2, DR2m, 'bo', N3, DR3m, 'bo');
xlabel('N'); ylabel('DR [det/s]');
axis([0 150 0 .5]); hold off;
legend('\rho =   0 dB', '\rho = -4 dB', '\rho = -8 dB');

