%  ------------------------------------------------------------------------------------------------
%   DESCRIPTION
%       mustBeOfSize(A,sz,dims) [argument validation]
%       
%       Compared dimensions are specified by 'dims', e.g. 2, [1 3], []
%       default is dims=1, equivalent to size(A)==[sz 1]
%
%       See also:   mustBeEqualDims 
%
%   INPUTS
%       A           array
%       sz          integer array of size of A along 'dims'
%       dims        integer array, default = 1
%
%   VERSION
%       v1.0 / 21.10.22 / V.Yotov
%  ------------------------------------------------------------------------------------------------

function mustBeOfSize(A,sz,dims)

arguments
    A
    sz {mustBeInteger,mustBePositive}
    dims {mustBeInteger,mustBePositive} = 1
end

% Error if comparison dimensions exceed argument dimensions
baseMsg = 'validators:mustBeOfSize';
if any(dims>ndims(A))
    msg = ['::argument ''' inputname(1) ''' has ' sprintf('%d',ndims(A)) ' dimensions and ' sprintf('%d',max(dims)) ' are required']; 
    throwAsCaller(MException('',[baseMsg msg]))
end

% Special case of scalar sz and array dims
if numel(sz)==1
    sz = repmat(sz,size(dims));
else
    mustBeEqualDims(dims,sz)
end

% Compare dimensions
szA = size(A);
if any(szA(dims)~=sz)
    throwAsCaller(MException('',baseMsg))
end
