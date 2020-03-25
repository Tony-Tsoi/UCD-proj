% EEC281 Project 3 Problem 2a
% Wai Cheong Tsoi 916182685

function y = gettotalpp(xarr)
    % Provided an array xarr
    % Return the total number of partial product terms
    % of all coefficients in xarr
    y = 0;
    for i = 1:length(xarr)
        y = y + numppterms(xarr(i));
    end
end