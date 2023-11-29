function [X, Y, Z] = GetCoordinates(numberOfLinks, model)
% Function to derive the X,Y,Z coordinates of the ends of the links for a
% given configuration
X = ones(numberOfLinks, 2); Y = ones(numberOfLinks, 2); Z = ones(numberOfLinks, 2);
X(1,1) = 0; Y(1,1) = 0; Z(1,1) = 0;
for i = 1:numberOfLinks
    iTj = GetTransformationWrtBase(model, i);
    r = iTj(1:3, 4);
    rx = r(1); ry = r(2); rz = r(3);
    X(i,2) = round(rx,1); Y(i,2) = round(ry,1); Z(i,2) = round(rz,1);
    X(i+1,1) = round(rx,1); Y(i+1,1) = round(ry,1); Z(i+1, 1) = round(rz,1);
    if (i == numberOfLinks)
        X(i+1,2) = round(rx,1); Y(i+1,2) = round(ry,1); Z(i+1, 2) = round(rz,1);
    end
end