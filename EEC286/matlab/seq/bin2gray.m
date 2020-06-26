function g = bin2gray(b)
    bsl1 = ['0', b(1:end-1)];
    b = b - 48; bsl1 = bsl1 - 48;
    g = xor(b, bsl1);
    g = char(g + 48);
end