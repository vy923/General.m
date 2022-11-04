function mustBeSubsOrM(A,B,C,textonly,chars)
%  ------------------------------------------------------------------------------------------------
%   DESCRIPTION
%       mustBeSubsOrM(A,B,C,textonly) [argument validation]
%
%       All elements of A must be substrings of elements of B, or members of C (case insensitive)
%       If textonly==false, A, B, C are directly converted to string
%
%   VERSION
%   v1.0 / 24.06.22 / V.Y.
%  ------------------------------------------------------------------------------------------------

% Def. no char/string conversion
if nargin < 5 || isempty(chars)
    chars = false(3,1);
elseif isscalar(chars)
    chars = chars | false(3,1);
end
if nargin < 4 || isempty(textonly) 
    textonly = true;    
end

% Allows calling with empty B or C
if textonly
    mustBeTextAny(A)
    if nargin<3 || ~isempty(C) 
        mustBeTextAny(C), 
    else, C = string.empty; 
    end
    if ~isempty(B) 
        mustBeTextAny(B), 
    else, B = string.empty; 
    end
end

% Convert to appropriate types
A = lower(string(A));   if chars(1), A=char(A); end
B = lower(string(B));   if chars(2), B=char(B); end
C = lower(string(C));   if chars(3), C=char(C); end

% Filter out members of B
idx = find(~ismember(A,C));

% Check remaining elements for subset 
if ~isempty(idx)
    for i = idx % ignorecase=true is implied from above
        if ~any(contains(B,A(i)),'all')
            throwAsCaller(MException("",strcat('validators:mustBeSubsOrM::element "', ...
            A(i), '" is not a substring of B or member of C')))
        end
    end
end














