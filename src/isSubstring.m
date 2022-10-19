%  ------------------------------------------------------------------------------------------------
%   DESCRIPTION
%       isSubstring(A,B,opts)
%
%       Finds elements of B containing as substrings any elements of A
%       See also: mustBeTextAny 
%
%   OUTPUTS
%       boolean array of dimension size(B)  
%
%   VERSION
%       v1.0 / 24.06.22 / V.Yotov
%  ------------------------------------------------------------------------------------------------

function mask = isSubstring(A,B,opts)

arguments
    A {mustBeTextAny}
    B {mustBeTextAny}
    opts.match      {mustBeMember(opts.match,{'start','end','any'})} = 'any'
    opts.ignoreCase {mustBeMember(opts.ignoreCase,[0 1])} = true
    opts.matchCond  {mustBeMember(opts.matchCond,{'any','all',''})} = ''
end
A = string(A);
B = string(B);

% Check which elements of B contain A
switch opts.match
    case 'start'
        mask = startsWith(B,A,'ignoreCase',opts.ignoreCase);
    case 'end'
        mask = endsWith(B,A,'ignoreCase',opts.ignoreCase);
    case 'any'
        mask = contains(B,A,'ignoreCase',opts.ignoreCase);
end

% For use as argument validator // as of v1.0 LEAVE UNUSED
switch opts.matchCond
    case []
        return
    case 'any'
        chk = any(mask,'all');
    case 'all'
        chk = all(mask,'all');
end
if ~chk
    throwAsCaller(MException('','validators:isSubstring::arguments string mistmatch'))
end







