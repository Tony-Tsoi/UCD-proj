% EEC281 Project 3 Problem 1a
% Wai Cheong Tsoi 916182685

%% Problem 1a
function y = numppterms(x)
    % Returns the number of partial product terms y
    % of an input fixed-number x
    
    if x == 0
        y = 0; return % No partial product terms for 0
    end
    
    % Get number of bits required for binary number of x
    intbits = ceil(log2(abs(x))) + 1;
    if abs(x) == 2^(intbits-1)
        intbits = intbits + 1;
    end
    
    bin2 = real2twos(x, intbits, 1) - 48; % Translate x to binary
    nbin2 = real2twos(-1*x, intbits, 1) - 48; % Get x's negative
    
    sbin2 = sum(bin2); snbin2 = sum(nbin2); % Get max num pp terms
    nbooth2 = ceil(intbits/2); % Get num Booth-2 terms
    
    % Optimize by checking consecutive 1s
    for i = 1:intbits-1
        if sum(bin2(i:i+2)) == 3
            sbin2 = sbin2 - 1;
        end
        if sum(nbin2(i:i+2)) == 3
            snbin2 = snbin2 - 1;
        end
    end
    
    % Check 000 and 111 for Booth-2
    for i = 1:2:intbits-2
        if sum(bin2(i:i+2)) == 0 || sum(bin2(i:i+2)) == 3
            nbooth2 = nbooth2 - 1;
        end
    end
    
    y = min([sbin2, snbin2, nbooth2]); % Return the min of three
end

%% Provided Function
function twos = real2twos(real, intbits, fracbits)
% twos_complement = real2twos(real, intbits, fracbits)
%
% Real number -> 2's complement binary string
%
% Useful for generating verilog statements (like a case statement
% lookup table).
%
% 2006/03/27  Written (BB)


%----- Check inputs
if (nargin ~= 3)
   fprintf(1, 'Error: real2twos: %i input args, not 3\n', nargin);
   twos = NaN;
   return;
end

if (imag(real) ~= 0)
   fprintf(1, 'Error: real2twos: input value is complex\n');
   twos = NaN;
   return;
end


%----- Preliminary calculations
Lsb     = 2^(-fracbits);
Msb     = 2^(intbits-1);        % actually negative since 2's complement

%----- A few checks
% Check that input is not too large
if (real > (Msb - Lsb))
   fprintf(1, 'Error: real2twos: input %f too large\n', real);
   twos = NaN;
   return;
end

% Check that input is not too small
if (real < (-Msb))
   fprintf(1, 'Error: real2twos: input %f too negative\n', real);
   twos = NaN;
   return;
end

%----- Main
if (real < 0)
   remainder = real + Msb;
   twos = '1';
else
   remainder = real;
   twos = '0';
end

for k=(intbits-2):-1:(-fracbits)
   temp = 2^k;
   if (remainder >= temp)
      remainder = remainder - temp;
      twos = strcat(twos, '1');
   else
      twos = strcat(twos, '0');
   end
end

% Give warning if number can not be fully represented.  The output
% number is truncated, not rounded!
if (remainder ~= 0)
   fprintf(1, 'Warning: real2twos: input %f does not fit spec.\n', real);
end
end