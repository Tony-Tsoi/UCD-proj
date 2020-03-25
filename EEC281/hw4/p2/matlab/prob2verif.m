%% prob2verif
% Verifies inputs and outputs exported in prob2out.m
clear; % Clear variables
prob2out; % Load variables from files

% Preallcate matrices
image = zeros(23, 23, 3); filter = zeros(11, 11, 3);
output = zeros(16, 3); output_g = zeros(16, 3);

% Convert
for i = 1:23
    img = char(imgROM(i));
    for j = 1:23
        image(i, j, 1) = bin2dec(img((24*(j-1)+1):(24*(j-1)+8)));
        image(i, j, 2) = bin2dec(img((24*(j-1)+9):(24*(j-1)+16)));
        image(i, j, 3) = bin2dec(img((24*(j-1)+17):(24*(j-1)+24)));
    end
end

for i = 1:11
    fil = char(filROM(i));
    for j = 1:11
        filter(i, j, 1) = bin2dec(fil((24*(j-1)+1):(24*(j-1)+8)));
        filter(i, j, 2) = bin2dec(fil((24*(j-1)+9):(24*(j-1)+16)));
        filter(i, j, 3) = bin2dec(fil((24*(j-1)+17):(24*(j-1)+24)));
    end
end

for i = 1:16
    out = char(outMem(i));
    output(i, 1) = bin2dec(out(1:24));
    output(i, 2) = bin2dec(out(25:48));
    output(i, 3) = bin2dec(out(49:72));
end

% Calculate Reference
for i = 1:16
    j = floor((i-1)/4); k = mod(i-1, 4);
    fil = image((4*j+1):(4*j+11), (4*k+1):(4*k+11), :) .* filter;
    fil = sum(sum(fil));
    output_g(i, 1) = fil(1);
    output_g(i, 2) = fil(2);
    output_g(i, 3) = fil(3);
end

% Print Reference in format of simulation tool output for compare
for i = 1:16
    a = dec2bin(output_g(i, 1));
    b = dec2bin(output_g(i, 2));
    c = dec2bin(output_g(i, 3));
    if length(a) < 24
        a = [char(48*ones(1, 24-length(a))), a];
    end
    if length(b) < 24
        b = [char(48*ones(1, 24-length(b))), b];
    end
    if length(c) < 24
        c = [char(48*ones(1, 24-length(c))), c];
    end
    d = strcat(a, b, c);
    d1 = dec2hex(bin2dec(d(1:40)));
    d2 = dec2hex(bin2dec(d(41:72))); % bottom 32 bits
    d = strcat(d1, d2);
    if length(d) < 18
        d = [char(48*ones(1, 18-length(d))), d];
    end
    fprintf("Address = %i,\t Value=%s\n", i-1, lower(d));
end

% Verify
if all(all(output == output_g))
    disp("ok!");
else
    disp("Error!");
end