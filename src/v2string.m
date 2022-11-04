function v2string(varargin)
%  ------------------------------------------------------------------------------------------------
%   DESCRIPTION
%       v2string(varargin) converts inputs to string and overwrites them in caller
%
%   VERSION
%   v1.0 / 24.06.22 / V.Y.
%  ------------------------------------------------------------------------------------------------

for i = 1:nargin
    assignin('caller',inputname(i),string(varargin{i}))
end
