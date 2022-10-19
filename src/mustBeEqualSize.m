%  ------------------------------------------------------------------------------------------------
%   DESCRIPTION
%       mustBeEqualSize(A) [argument validation]
%
%   VERSION
%       v1.1 / 25.06.22 / V.Yotov
%       -- / -- / mathworks.com
%  ------------------------------------------------------------------------------------------------

function mustBeEqualSize(a,b)

if ~isequal(size(a),size(b))
    throwAsCaller(MException('','validators:mustBeEqualSize'))
end