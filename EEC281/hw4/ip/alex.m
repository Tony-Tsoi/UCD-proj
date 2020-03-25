% alex.m
% 
% 2020/03/02  Minor touch ups (BB)
% 2019/03/11  First version done (BB)
% 

clear;

%--- Set these
% Set LoadData=1 to load the data file written by the verilog simulation. 
% It should include:
%   aa   image data                    3D bytes
%   f    filter data                   3D bytes
%   out  convolutional result data     1D integers
LoadData            = 1;      % 0=load from vdata.m, 1=small ints, 2=random
DimensionImage      = 23;     % 23 x 23 x 3
DimensionFilter     = 11;     % 11 x 11 x 3

%--- Generate random image data and filters when not loading verilog data
if (LoadData == 0)              % load data from file vdata.m
  vdata.m       

elseif (LoadData == 1)          % only for testing this matlab script
  for k1=1:23
    for k2=1:23
      for k3=1:3
        aa(k1,k2,k3) = k1+k2+k3;
      end
    end
  end
  for k1=1:11
    for k2=1:11
      for k3=1:3
        f(k1,k2,k3) = k1+k2+k3-3;
      end
    end
  end

elseif (LoadData == 2)          % only for testing this matlab script
  RandomNumberGenSeed = 281;
  rng(RandomNumberGenSeed)
  aa = round(8* rand(23,23,3) - 0.5);
  f  = round(8* rand(11,11,3) - 0.5);

else
  fprintf('Error\n\n');  return;
end

%--- Perform filtering
for xoffset = 1:4:(DimensionImage-DimensionFilter)+1
  for yoffset = 1:4:(DimensionImage-DimensionFilter)+1
    aawindow = aa(xoffset:xoffset+10, yoffset:yoffset+10, :);
    product  = f  .* aawindow;
    out      = sum(sum(sum(product)));
    fprintf('out(%i,%i) = %i\n\n', xoffset, yoffset, out);
  end
end

fprintf('Type "aa <return> to see pixel array\n');
fprintf('Type "f  <return> to see filter array\n\n');

