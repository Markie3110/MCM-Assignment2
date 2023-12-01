function [X, Y, Z] = GetCoordinates(numberOfLinks, model)
% Function to derive the X,Y,Z coordinates of the ends of the links for a
% given configuration

% Initialize the vectors describing the x,y and z coordinates
X = ones(numberOfLinks, 2); Y = ones(numberOfLinks, 2); Z = ones(numberOfLinks, 2);

% Set the first coordinate to be (0,0,0)
X(1,1) = 0; Y(1,1) = 0; Z(1,1) = 0;

% Iterate through each frame 
for i = 1:numberOfLinks
    %Obtain the transformation of the frame w.r.t. the base 
    iTj = GetTransformationWrtBase(model, i);

    % Extract the vector linking the origins
    r = iTj(1:3, 4);
    rx = r(1); ry = r(2); rz = r(3);

    % Condition to be executed if at the end of the loop
    if (i == numberOfLinks)
        X(i,2) = round(rx,3); Y(i,2) = round(ry,3); Z(i,2) = round(rz,3);
        break;
    end

    % Place the x, y and z coordinates to the appropriate positions in the
    % vectors
    X(i,2) = round(rx,3); Y(i,2) = round(ry,3); Z(i,2) = round(rz,3);
    X(i+1,1) = round(rx,3); Y(i+1,1) = round(ry,3); Z(i+1, 1) = round(rz,3);
end