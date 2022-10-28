%  ------------------------------------------------------------------------------------------------
%   DESCRIPTION
%       mustBeTextAny(A) [argument validation]
%
%       See also: isTextAny
%
%   VERSION
%       v1.0 / 24.06.22 / V.Yotov
%  ------------------------------------------------------------------------------------------------

function mustBeTextAny(A)

if ~isTextAny(A)
    throwAsCaller(MException('','validators:mustBeTextAny'))
end