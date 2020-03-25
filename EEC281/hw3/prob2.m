% EEC281 Project 3 Problem 2
% Wai Cheong Tsoi 916182685

%% Problem 2a
coeff = [26   -43   317   696   317   -43   26]; % Define coefficients

totalppterms = gettotalpp(coeff); % Call helper function

% Print result
fprintf("Total number of partial product terms = %i\n", totalppterms);

%% Problem 2b
kmin = 0.5; kmax = 1; kscale = 0.00025; % Set up intial values
pparray = zeros(1, (kmax-kmin)/kscale); % allocate

% For each k value, calculate total pp terms
for k = kmin:kscale:kmax
    kcoef = round( k.*coeff );
    pparray(round((k-kmin)/kscale) +1) = gettotalpp(kcoef);
end
kansppterms = min(pparray);
kansmin = (find(pparray == kansppterms) - 1) * kscale + kmin;

% Print results
for i = 1:length(kansmin)
    k = kansmin(i);
    kcoef = round(k.*coeff);
    fprintf("k = %.4f\tPartial product terms = %i\n", k, kansppterms);
    fprintf("Scaled coefficients = [%i, %i, %i, %i, %i, %i, %i]\n", kcoef);
end

%% Problem 2c
figure; plot(kmin:kscale:kmax, pparray, 'x'); % Plot results
axis([0.48 1.02 0 26]);  grid on;
xlabel('Scaling factor'); ylabel('Number of partial product terms');
title('EEC 281, Hwk/proj 3, Problem 2');