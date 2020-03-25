function twos = real2twos(real, intbits, fracbits)
% twos_complement = real2twos(real, intbits, fracbits)
%
% Real number -> 2's complement binary string
%
% Useful for generating verilog statements (like a case statement
% lookup table).
%
% 2006/03/27  Written (BB)

showWarning = 0;

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
Lsb = 2^(-fracbits); Msb = 2^(intbits-1);

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
if (remainder ~= 0) && showWarning
   fprintf(1, 'Warning: real2twos: input %f does not fit spec.\n', real);
end

end