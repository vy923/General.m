function mustBeMemberSCI(A,B)
%  ------------------------------------------------------------------------------------------------
%   DESCRIPTION
%       mustBeMemberSCI(A,B) [argument validation]
%       Case insensitive string comparison
%
%   VERSION
%   v1.0 / 22.10.22 / V.Y.
%  ------------------------------------------------------------------------------------------------

mustBeMember(lower(string(A)),lower(string(B)))