function b = gray2bin(g)
    b = g - 48;
    mask = [0, b(1:end-1)];
    while any(mask)
        b = xor(b, mask);
        mask = [0, mask(1:end-1)];
    end
    b = char(b + 48);
end