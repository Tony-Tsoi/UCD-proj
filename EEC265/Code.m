%% EEC 265 Project - Noise Analysis of 64QAM
% Last Name: Tsoi
% First Name: Wai Cheong
% SID: 916182685

%% Parameters
EbNodb = linspace(0, 15, 50); % Eb/No, in dB
M = 64; % Coherent 64-QAM
N = 1000; % Number of trials per Symbol per Eb/No

%% Pre-Calculation
EbNo = 10.^(EbNodb./10); % Convert to decimal
Q = @(x) qfunc(x); % Just for aesthetic
numBETot = zeros(M, length(EbNo)); % Total Num Bit Error for each Eb/No

%% Calculation: Theoretical
Pb_t = 4*(1-1/sqrt(M))/log2(M) * Q(sqrt(3*log2(M)/(M-1).*EbNo));

%% Calculation: Simulation - Noise Analysis
% For each Eb/No
for i = 1:length(EbNo)
    % For each symbol
    for j = 0:M-1
        % N number of trials, get number of error bits
        numBETot(j+1, i) = numBEperEbNo(EbNo(i), j, N);
    end
end

% Bit Error Rate
Pb_s = sum(numBETot)./N./M./log2(M);

%% Plot
clf;
semilogy(EbNodb, Pb_t, EbNodb, Pb_s, 'x');
xlabel('E_b/N_0(dB)');
ylabel('P_b');
ylim([min(min(Pb_t), min(Pb_s)) 1]);
grid on; legend('Theoretical', 'Simulated');
title('64QAM Bit Error Probability');

%% Helper Function Declarations
function numBE = numBEperEbNo(EbNo, S, N)
% Gets number of error bits for given EbNo, 64QAM symbol for N trials

% Let No = 2 such that Noise is N(0, 1)
No = 2; Eb = EbNo * No;

% Distance between symbols
M = 64; dmin = sqrt(6*Eb*log2(M) / (M-1));

% Number of bit errors
numBE = 0; 

% Noise Ni and Nq, in ratio of dmin/2
ni = randn(1, N) ./ (dmin/2); % 1x1000 normally distributed noise
nq = randn(1, N) ./ (dmin/2); % in scale of dmin/2

% Error detection by noise range
for i = 1:N
    % For each trial, get number of bit error
    nii = ni(i); nqi = nq(i);
    
    % Get position difference from symbol
    dx = floor((nii+1)/2);
    dy = floor((nqi+1)/2);
    
    % Get numBE
    numBE = numBE + getNumBE(S, dx, dy);
end

end

function d = getNumBE(S, dx, dy)
% Returns number of error bits

% Gray code matrix
G = [[0 0 0 0 1 1 1 1];
     [0 0 1 1 1 1 0 0];
     [0 1 1 0 0 1 1 0]];

% Position of x y by symbol
x = fix(S/8); y = rem(S,8);
xd = x+dx; yd = y+dy;

% Edge cases (literally)
if xd < 0
    xd = 0;
elseif xd > 7
    xd = 7;
end
if yd < 0
    yd = 0;
elseif yd > 7
    yd = 7;
end

% Translate to Gray code
sx = G(:, x+1); sy = G(:, y+1);
s1 = G(:, xd+1); s2 = G(:, yd+1);

% Difference in bits
d = sum(xor(sx, s1)) + sum(xor(sy, s2));
end