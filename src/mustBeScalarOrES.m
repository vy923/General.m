%  ------------------------------------------------------------------------------------------------
%   DESCRIPTION
%       mustBeScalarOrES(A,B) [argument validation]
%       First argument must be a scalar or the same size as the second
%
%   VERSION
%       v1.0 / 30.10.22 / V.Yotov
%  ------------------------------------------------------------------------------------------------

function mustBeScalarOrES(a,b)

if ~isscalar(a) && ~isequal(size(a),size(b))
    throwAsCaller(MException('','validators:mustBeScalarOrES'))
end

