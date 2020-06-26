function x = pseudexTest(ft, fg, numTests)
    inlen = 13;
    x = zeros(1, numTests);
    fileID = fopen('tv.txt', 'w');
    
    % Get a count up counter of random starting point
    t = randi(2^inlen, 1, 1);
    
    testLimit = getPseudexNumTests();
    if numTests > testLimit
        numTests = testLimit;
    end

    for i = 1:numTests
        while ~isValidPseudexVector(t)
            t = t + 1;
            if t >= 2^inlen
                t = 0;
            end
        end
        fprintf(fileID, "%i\n", t);
        in2 = dec2bin(t);
        if length(in2) < inlen
            in2 = [char(48*ones(1, inlen-length(in2))), in2];
        end
        outg = fg(in2);
        outt = ft(in2);
        x(i) = any(outt ~= outg);
        t = t + 1;
        if t >= 2^inlen
            t = 0;
        end
    end
    fclose(fileID);
end