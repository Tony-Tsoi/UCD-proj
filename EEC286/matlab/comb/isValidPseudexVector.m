function out = isValidPseudexVector(t)
    inlen = 13;

    bsi = dec2bin(t);
    if length(bsi) < inlen
        bsi = [char(48*ones(1, inlen-length(bsi))), bsi];
    end
    
    % 3b op, 5b in1, 5b in2
    opc = bin2dec(bsi(1:3));

    % disregard vectors of "don't cares"
    if opc == 2 || opc == 3
        usb = bin2dec(bsi(9:10));
        out = usb == 0;
        return
    end
    if opc == 7
        out = t == (2^12 + 2^11 + 2^10);
        return
    end
    out = true;
end