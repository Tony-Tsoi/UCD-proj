function x = exhauTest(ft, fg, numTests)
    inlen = 13;
    
    % Get a count up counter of random starting point
    ranum = randi(2^inlen, 1, 1);
    T = [ranum:(2^inlen-1), 0:(ranum-1)];
    
    x = zeros(1, numTests);
    for i = 1:numTests
        t = T(i);
        in2 = dec2bin(t);
        if length(in2) < inlen
            in2 = [char(48*ones(1, inlen-length(in2))), in2];
        end
        outg = fg(in2);
        outt = ft(in2);
        x(i) = any(outt ~= outg);       
    end
end