function numFaults = getNumFaults(ft, fg)
    inlen = 13;
    numFaults = 0;
    
    for in = 0:(2^inlen-1)
        in2 = dec2bin(in);
        if length(in2) < inlen
            in2 = [char(48*ones(1, inlen-length(in2))), in2];
        end
        outg = fg(in2);
        outt = ft(in2);
        if any(outg ~= outt)
            numFaults = numFaults + 1;
        end
    end
end