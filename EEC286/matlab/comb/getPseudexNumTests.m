function numTests = getPseudexNumTests()
    inlen = 13;
    numTests = 0;

    for in = 0:(2^inlen-1)
        if isValidPseudexVector(in)
            numTests = numTests + 1;
        end
    end
end