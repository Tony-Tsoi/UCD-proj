% EEC281 Project 3 Problem 1b
% Wai Cheong Tsoi 916182685

%% Problem 1b

% Initial setup
StepSize = 0.5; NumTermsArrayPos = zeros(1, 100/StepSize);

% Get the numppterms array
for k = StepSize:StepSize:100
   NumTermsArrayPos(k/StepSize) = numppterms(k);
end

% Print and plot
fprintf('Total sum for +0.5 - +100.00 = %i\n', sum(NumTermsArrayPos));
figure; plot(StepSize:StepSize:100, NumTermsArrayPos, 'x');
axis([0 101 0 1.1* max(NumTermsArrayPos)]);
xlabel('Input number'); ylabel('Number of partial product terms');