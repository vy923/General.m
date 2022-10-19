%  ------------------------------------------------------------------------------------------------
%   DESCRIPTION
%       C = isTextAny(A) 
%
%       Checks if all elements of A are text, returns 1 x 1 BOOL
%       Strings in cell arrays also return TRUE
%                        
%   VERSION
%       v1.0 / 24.06.22 / V.Yotov
%  ------------------------------------------------------------------------------------------------

function C = isTextAny(A)

if iscell(A)
    C = cellfun(@class,A,'UniformOutput',false);
else
    C = class(A);
end
C = all(ismember(string(C),["char" "string"]),'all');
