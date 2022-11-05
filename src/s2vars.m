function s2vars(varargin)
%  ------------------------------------------------------------------------------------------------
%   DESCRIPTION
%       s2vars(varargin) unpacks fields of input structures to caller
%
%   VERSION
%   v1.0 / 05.11.22 / V.Y.
%  ------------------------------------------------------------------------------------------------

for j = 1:nargin
    s = varargin{j};
    if ~isstruct(s)
        error(['s2vars: input ' sprintf('%d',j) ' is not a structure'])
    end
    n = fieldnames(s);
    for i = 1:numel(n)
        assignin('caller',n{i},s.(n{i}))
    end  
end


