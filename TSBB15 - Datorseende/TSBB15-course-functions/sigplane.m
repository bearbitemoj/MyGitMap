function z=dftplane(M,N)
% 
%   z=sigplane(N)                NxN matrix
%   z=sigplane(M,N)              MxN matrix
%   z=sigplane(size(x))          same size as x
%
% Create a reference array with complex values corresponding
% to the direction and distance from the center of the array.
%
% NOTE! For even sized arrays the point (row,col)=(1+M/2,1+N/2), 
% i.e the lowest rightmost element of the four center elements,
% is considered to correspond to the origin.
% 
% Parameter  Range      Default            Description
% =========  =========  =================  ===========================
% M           1 - inf         11           Number of rows.
% N           1 - inf         11           Number of columns.
% ====================================================================
%
% See also DFTPLANE
%
% Author: Carl-Johan Westelius, Dept of EE,
%         Linkoeping University, Sweden.
%         cawe@isy.liu.se

if nargin == 2
   cols=N;
   rows=M;
elseif nargin == 1
       [rows cols]=size(M);
       if (rows == 1)
          if (cols == 1)
            rows=M;
            cols=M;
          else
            rows=M(1);
            cols=M(2);
          end
       else
          cols= -1; %illigal definition
          rows= -1;
       end
     else
       cols=11; %default values
       rows=11;
end

if (cols <= 0)|(rows <= 0)
   fprintf(1,'  ERROR! Illegal parameter value!!!!!!!!!!!!')
   help dftplane
   return
end;

hsz=floor(cols/2);
if 2*hsz < cols
   z = ones(rows,1)*[-hsz:hsz];
else
   z = ones(rows,1)*[-hsz:hsz-1];
end

hsz=floor(rows/2);
if 2*hsz < rows
   z=z-i*[hsz:-1:-hsz]'*ones(1,cols);
else
   z=z-i*[hsz:-1:-hsz+1]'*ones(1,cols);
end


