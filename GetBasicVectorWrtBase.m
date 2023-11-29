function [r]=GetBasicVectorWrtBase(biTei, linkNumber)
%%% GetBasicVectorWrtBase function 
% input :
% biTei: trasnformation matrix in between frame i and frame j 
% linkNumber: link number 
% output
% r : basic vector from frame i to the robot base frame <0>

bTi = eye(4);
for i = 1:linkNumber
    bTi = bTi * biTei(:,:,i);
end
r = bTi(1:3,4);

end