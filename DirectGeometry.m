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

% Extract the rotation vector from the fixed transformation
iRj = iTj(1:3, 1:3);
% Extract the distance vector from the fixed transformation
irj = iTj(1:3,4);
% Declare the axis of rotation as the z-axis
Ki = [0; 0; 1;];
% Declare the rotational matrix about the z-axis
R_z = [cos(qi) -sin(qi) 0;
       sin(qi) cos(qi)  0;
       0         0      1;];

if linkType == 0 % rotational
    irj_q = irj;
    iRj_q = iRj * R_z;
elseif linkType == 1 % prismatic
    irj_q = irj + (Ki*qi);
    iRj_q = irj;
end

% Put in the values into the new transformation matrix
iTj_q = zeros(4, 4);
iTj_q(1:3, 1:3) = iRj_q; 
iTj_q(1:3, 4) = irj_q;
iTj_q(4, 4) = 1;

end