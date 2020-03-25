clear; clc;
% Test 1
a = [0,0]; b = [0,0]; w = [0,0];
getRef(a, b, w, 1);

% Test 2
a = [2^-14,0]; b = [0,0]; w = [0,0];
getRef(a, b, w, 2);

% Test 3
a = [0,2^-12]; b = [0,0]; w = [0,0];
getRef(a, b, w, 3);

% Test 4
a = [0,0]; b = [2^-12,0]; w = [0,0];
getRef(a, b, w, 4);

% Test 5
a = [0,0]; b = [0,2^-12]; w = [0,0];
getRef(a, b, w, 5);

% Test 6
a = [0,0]; b = [0,0]; w = [2^-12,0];
getRef(a, b, w, 6);

% Test 7
a = [0,0]; b = [0,0]; w = [0,2^-12];
getRef(a, b, w, 7);

% Test 8
a = [0,0]; b = [2^-12,0]; w = [1,1];
getRef(a, b, w, 8);

% Test 8
a = [0,0]; b = [2^-12,0]; w = [1,1];
getRef(a, b, w, 8);

% Test 9
a = [0,0]; b = [0, 2^-12]; w = [1,1];
getRef(a, b, w, 9);

% Test 10
a = [0,0]; b = [2^-12, 2^-12]; w = [1,1];
getRef(a, b, w, 10);

% Test 11
a = [0,2^-12]; b = [1,-1]; w = [2-2^-14,2-2^-14];
getRef(a, b, w, 11);

% Test 12
a = [2^-12,2^-12]; b = [1,-1]; w = [1,1];
getRef(a, b, w, 12);

% Test 13
a = [1,1]; b = [1,-1]; w = [1,1];
getRef(a, b, w, 13);

% Test 14
a = [-2,-2]; b = [1,-1]; w = [1,1];
getRef(a, b, w, 14);

% Test 15
a = [2-2^-14, 2-2^-14]; b = [1,-1]; w = [1,1];
getRef(a, b, w, 15);

% Test 16
a = [-2,-2]; b = [2^-12,0]; w = [1,1];
getRef(a, b, w, 16);

% Test 17
a = [-2,-2]; b = [-2,-2]; w = [-1,-1];
getRef(a, b, w, 17);

% Test 18
a = [-2,-2]; b = [-2,-2]; w = [1,1];
getRef(a, b, w, 18);

% Test 19
a = [-2,-2]; b = [0,-1]; w = [0,2-2^-14];
getRef(a, b, w, 19);

% Test 20
a = [2^-12,2^-12]; b = [0,-2]; w = [1,2-2^-14];
getRef(a, b, w, 20);

% Test 21
a = [0,2^-12]; b = [1,-1]; w = [2-2^-14,2-2^-14];
getRef(a, b, w, 21);

% Test 22
wc = exp(-i*2*pi/8 * 0);
a = [0,0]; b = [1, -1]; w = [real(wc), imag(wc)];
getRef(a, b, w, 22);

% Test 23
wc = exp(-i*2*pi/8 * 1);
wr = real(wc); wi = imag(wc);
a = [0,0]; b = [1, -1]; w = [wr, wi];
getRef(a, b, w, 23);

% Test 24
wc = exp(-i*2*pi/8 * 2);
a = [0,0]; b = [1, -1]; w = [real(wc), imag(wc)];
getRef(a, b, w, 24);

% Test 25
wc = exp(-i*2*pi/8 * 3);
wr = real(wc); wi = imag(wc);
a = [0,0]; b = [1, -1]; w = [wr, wi];
getRef(a, b, w, 25);

% Test 26
wc = exp(-i*2*pi/8 * 4);
wr = real(wc); wi = imag(wc);
a = [0,0]; b = [1, -1]; w = [wr, wi];
getRef(a, b, w, 26);

% Test 27
wc = exp(-i*2*pi/8 * 5);
a = [0,0]; b = [1, -1]; w = [real(wc), imag(wc)];
getRef(a, b, w, 27);

% Test 28
wc = exp(-i*2*pi/8 * 6);
a = [0,0]; b = [1, -1]; w = [real(wc), imag(wc)];
getRef(a, b, w, 28);

% Test 29
wc = exp(-i*2*pi/8 * 7);
a = [0,0]; b = [1, -1]; w = [real(wc), imag(wc)];
getRef(a, b, w, 29);








%% Helper Functions
function getRef(a, b, w, nt)
    trunc = 0; debug = 0;
    ni = 4; nf = 28;
    ar = a(1); ai = a(2); br = b(1); bi = b(2); wr = w(1); wi = w(2);

    % Calculate
    amb = br - bi; cmd = wr - wi; cpd = wr + wi;
    m1 = amb * wi; m2 = cmd * br; m3 = cpd * bi;
    m12 = m1 + m2; m13 = m1 + m3;
    xr = m1 + m2 + ar; xi = m1 + m3 + ai;

    % Convert to hex for print
    ar = real2hex(ar, 2, 14); ai = real2hex(ai, 2, 14);
    br = real2hex(br, 2, 14); bi = real2hex(bi, 2, 14);
    wr = real2hex(wr, 2, 14); wi = real2hex(wi, 2, 14);

    amb = real2hex(amb, 3, 14); cmd = real2hex(cmd, 3, 14); cpd = real2hex(cpd, 3, 14);
    m1 = real2hex(m1, 4, 28); m2 = real2hex(m2, 4, 28); m3 = real2hex(m3, 4, 28);
    m12 = real2hex(m12, 4, 28); m13 = real2hex(m13, 4, 28);
    xr = real2twos(xr, ni, nf); xi = real2twos(xi, ni, nf);

    if trunc
        xr = xr(1:16); xi = xi(1:16);
    end

    xr = bin2hex(xr); xi = bin2hex(xi);

    % Print
    if nargin == 4
        fprintf("Test %i\n", nt);
    end
    fprintf("ar=%s, ai=%s, br=%s, bi=%s, wr=%s, wi=%s\n", ...
        ar, ai, br, bi, wr, wi);
    if debug
        fprintf("amb=%s, cmd=%s, cpd=%s, m1=%s, m2=%s, m3=%s\n", ...
            amb, cmd, cpd, m1, m2, m3);
        fprintf("m12=%s, m13=%s\n", m12, m13);
    end
    fprintf("xr=%s, xi=%s\n\n", xr, xi);
end

function d = real2dec(r, ni, nf)
    d = bin2dec(real2twos(r, ni, nf));
end

function h = real2hex(r, ni, nf)
    b = real2twos(r, ni, nf);
    h = dec2hex(bin2dec(b));
end

function h = bin2hex(b)
    h = dec2hex(bin2dec(b));
end

function r = twos2dec(b, ni, nf)
    if length(b) ~= (ni+nf)
        disp("Error: length mismatch.");
        return;
    end
    
    % positive case
    if b(1) == '0'
        r = bin2dec(b) / 2^nf;
        return;
    end
    
    % negative case
    d = bin2dec(b(2:end)) / 2^(nf);
    r = d - 2^(ni-1);
end