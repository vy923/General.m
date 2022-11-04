function mustBeScalarOrES(a,b)
%  ------------------------------------------------------------------------------------------------
%   DESCRIPTION
%       mustBeScalarOrES(A,B) [argument validation]
%       A must be a scalar or equal size as B
%
%   VERSION
%   v1.0 / 30.10.22 / V.Y.
%  ------------------------------------------------------------------------------------------------

if ~isscalar(a) && ~isequal(size(a),size(b))
    throwAsCaller(MException('','validators:mustBeScalarOrES'))
end

