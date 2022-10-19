%  ------------------------------------------------------------------------------------------------
%   DESCRIPTION
%       mustBeStartString(A,B) [argument validation]
%
%       All elements of A must be starting substrings of some elements of B (case insensitive)
%       See also: isSubstring, mustBeTextAny
%
%   VERSION
%       v1.0 / 24.06.22 / V.Yotov
%  ------------------------------------------------------------------------------------------------

function mustBeStartString(A,B)

arguments 
    A {mustBeTextAny}
    B {mustBeTextAny}
end
A = string(A); 

for i = 1:numel(A)
    if ~any(isSubstring(A(i),B,match='start'),'all')
        msg = strcat('validators:mustBeStartString::element "', A(i), '" is not a member of allowed set');
        throwAsCaller(MException('',msg))
    end
end