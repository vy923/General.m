function mustBeEqualDims(A,B,dims)
%  ------------------------------------------------------------------------------------------------
%   DESCRIPTION
%       mustBeEqualDims(A,B,dims) [argument validation]
%       
%       Compared dimensions are specified by 'dims', e.g. 2, [1 3], []
%       default is dims=[], equivalent to A and B having equal size
%
%   VERSION
%   v1.0 / 27.06.22 / V.Y.
%  ------------------------------------------------------------------------------------------------

arguments 
    A
    B
    dims {mustBeInteger,mustBePositive} = []
end

% Error if comparison dimensions exceed argument dimensions
baseMsg = 'validators:mustBeEqualDims';
if any(dims>ndims(A))
    msg = ['::argument ''' inputname(1) ''' has ' sprintf('%d',ndims(A)) ' dimensions and ' sprintf('%d',max(dims)) ' are required']; 
    throwAsCaller(MException('',[baseMsg msg]))
elseif any(dims>ndims(B))
    msg = ['::argument ''' inputname(2) ''' has ' sprintf('%d',ndims(B)) ' dimensions and ' sprintf('%d',max(dims)) ' are required']; 
    throwAsCaller(MException('',[baseMsg msg]))
end

% Compare dimensions
if (isempty(dims) && ~isequal(size(A),size(B))) || (~isempty(dims) && ~isequal(size(A,dims),size(B,dims)))
    throwAsCaller(MException('',baseMsg))
end
