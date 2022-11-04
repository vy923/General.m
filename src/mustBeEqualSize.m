function mustBeEqualSize(a,b)
%  ------------------------------------------------------------------------------------------------
%   DESCRIPTION
%       mustBeEqualSize(A) [argument validation]
%
%   VERSION
%   v1.1 / 25.06.22 / V.Y.
%   -- / -- / mathworks.com
%  ------------------------------------------------------------------------------------------------

if ~isequal(size(a),size(b))
    throwAsCaller(MException('','validators:mustBeEqualSize'))
end