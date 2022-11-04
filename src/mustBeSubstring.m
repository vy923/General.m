function mustBeSubstring(A,B)
%  ------------------------------------------------------------------------------------------------
%   DESCRIPTION
%       mustBeSubstring(A,B) [argument validation]
%       All elements of A must be substrings of some elements of B (case insensitive)
%
%       See also: mustBeTextAny, isSubstring
%
%   VERSION
%   v1.0 / 24.06.22 / V.Y.
%  ------------------------------------------------------------------------------------------------

arguments 
    A {mustBeTextAny}
    B {mustBeTextAny}
end
A = string(A);  

for i = 1:numel(A)
    if ~any(isSubstring(A(i),B,match='any'),'all')
        msg = strcat('validators:mustBeSubstring::element "', A(i), '" is not a member of allowed set');
        throwAsCaller(MException('',msg))
    end
end