%  ------------------------------------------------------------------------------------------------
%   DESCRIPTION
%       mustBeMemberSCI(A,B) [argument validation]
%       Case insensitive string comparison
%
%   VERSION
%       v1.0 / 22.10.22 / V.Yotov
%  ------------------------------------------------------------------------------------------------

function mustBeMemberSCI(A,B)
    mustBeMember(lower(string(A)),lower(string(B)))