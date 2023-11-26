function iTj_q = DirectGeometry(qi, iTj, linkType)
% DirectGeometry Function 
% inputs: 
% qi : current joint position;
% iTj is the constant transformation between the base of the link <i>
% and its follower frame <j>; 
% jointType :0 for revolute, 1 for prismatic

% output :
% iTj_q : transformation between the base of the joint <i> and its follower frame taking 
% into account the actual rotation/traslation of the joint

if linkType == 0 % rotational
    T_q(1,1) = cos(qi); T_q(1,2) = -sin(qi); T_q(1,3) = 0; T_q(1,4) = 0;
    T_q(2,1) = sin(qi); T_q(2,2) = cos(qi); T_q(2,3) = 0; T_q(2,4) = 0;
    T_q(3,1) = 0; T_q(3,2) = 0; T_q(3,3) = 1; T_q(3,4) = 0;
    T_q(4,1) = 0; T_q(4,2) = 0; T_q(4,3) = 0; T_q(4,4) = 1;

    iTj_q = iTj*T_q;
elseif linkType == 1 % prismatic
    T_q(1,1) = 1; T_q(1,2) = 0; T_q(1,3) = 0; T_q(1,4) = 0;
    T_q(2,1) = 0; T_q(2,2) = 1; T_q(2,3) = 0; T_q(2,4) = 0;
    T_q(3,1) = 0; T_q(3,2) = 0; T_q(3,3) = 1; T_q(3,4) = qi;
    T_q(4,1) = 0; T_q(4,2) = 0; T_q(4,3) = 0; T_q(4,4) = 1;

    iTj_q = iTj*T_q;
end

end