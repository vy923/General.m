function C = isTextAny(A)
%  ------------------------------------------------------------------------------------------------
%   DESCRIPTION
%       C = isTextAny(A) 
%
%       Checks if all elements of A are text, returns 1 x 1 BOOL
%       Strings in cell arrays also return TRUE
%                        
%   VERSION
%   v1.1 / 04.11.22 / --    optimised
%   v1.0 / 24.06.22 / V.Y.
%  ------------------------------------------------------------------------------------------------

if iscell(A)
    C = cellfun(@class,A,'UniformOutput',false);
    C = all(ismember(string(C),["char" "string"]), 'all');
else 
    C = all(isa(A,'char')|isa(A,'string'), 'all');
end
