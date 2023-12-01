function [iTj] = BuildTree_Mark()
% This function should build the tree of frames for the chosen manipulator.
% Inputs: 'None'
% Outputs: The tree of frames.

% iTj is a 3-dimensional matlab matrix, suitable for defining tree of
% frames. iTj should represent the transformation matrix between the i-th and j-th
% frames. iTj(row,col,link_idx)

% Joint 1 (0T1)
iTj(1,1,1) = 1; iTj(1,2,1) = 0; iTj(1,3,1) = 0; iTj(1,4,1) = 0;
iTj(2,1,1) = 0; iTj(2,2,1) = 1; iTj(2,3,1) = 0; iTj(2,4,1) = 0;
iTj(3,1,1) = 0; iTj(3,2,1) = 0; iTj(3,3,1) = 1; iTj(3,4,1) = 1.75;
iTj(4,1,1) = 0; iTj(4,2,1) = 0; iTj(4,3,1) = 0; iTj(4,4,1) = 1;

% Joint 2 (1T2)
theta = deg2rad(-90);
iTj(1,1,2) = 1;          iTj(1,2,2) = 0;          iTj(1,3,2) = 0;           iTj(1,4,2) = 0;
iTj(2,1,2) = 0;          iTj(2,2,2) = cos(theta); iTj(2,3,2) = -sin(theta); iTj(2,4,2) = 0;
iTj(3,1,2) = 0;          iTj(3,2,2) = sin(theta); iTj(3,3,2) = cos(theta);  iTj(3,4,2) = 0.98;
iTj(4,1,2) = 0;          iTj(4,2,2) = 0;          iTj(4,3,2) = 0;           iTj(4,4,2) = 1;

% Joint 3 (2T3)
theta = deg2rad(-90);
iTj(1,1,3) = cos(theta); iTj(1,2,3) = 0;          iTj(1,3,3) = sin(theta);  iTj(1,4,3) = -1.05;
iTj(2,1,3) = 0;          iTj(2,2,3) = 1;          iTj(2,3,3) = 0;           iTj(2,4,3) = 0;
iTj(3,1,3) = -sin(theta); iTj(3,2,3) = 0;         iTj(3,3,3) = cos(theta);  iTj(3,4,3) = 0;
iTj(4,1,3) = 0;          iTj(4,2,3) = 0;          iTj(4,3,3) = 0;           iTj(4,4,3) = 1;

% Joint 4 (3T4)
theta = deg2rad(90);
iTj(1,1,4) = cos(theta); iTj(1,2,4) = 0;          iTj(1,3,4) = sin(theta);  iTj(1,4,4) = 0;
iTj(2,1,4) = 0;          iTj(2,2,4) = 1;          iTj(2,3,4) = 0;           iTj(2,4,4) = -1.455;
iTj(3,1,4) = -sin(theta); iTj(3,2,4) = 0;         iTj(3,3,4) = cos(theta);  iTj(3,4,4) = 3.265;
iTj(4,1,4) = 0;          iTj(4,2,4) = 0;          iTj(4,3,4) = 0;           iTj(4,4,4) = 1;

% Joint 5 (4T5)
theta = deg2rad(90);
iTj(1,1,5) = cos(theta); iTj(1,2,5) = 0;          iTj(1,3,5) = sin(theta);  iTj(1,4,5) = 0.35;
iTj(2,1,5) = 0;          iTj(2,2,5) = 1;          iTj(2,3,5) = 0;           iTj(2,4,5) = 0;
iTj(3,1,5) = -sin(theta); iTj(3,2,5) = 0;         iTj(3,3,5) = cos(theta);  iTj(3,4,5) = 0;
iTj(4,1,5) = 0;          iTj(4,2,5) = 0;          iTj(4,3,5) = 0;           iTj(4,4,5) = 1;

% Joint 6 (5T6)
theta = deg2rad(-90);
iTj(1,1,6) = cos(theta); iTj(1,2,6) = 0;          iTj(1,3,6) = sin(theta);  iTj(1,4,6) = 0;
iTj(2,1,6) = 0;          iTj(2,2,6) = 1;          iTj(2,3,6) = 0;           iTj(2,4,6) = 0;
iTj(3,1,6) = -sin(theta); iTj(3,2,6) = 0;         iTj(3,3,6) = cos(theta);  iTj(3,4,6) = 3.85;
iTj(4,1,6) = 0;          iTj(4,2,6) = 0;          iTj(4,3,6) = 0;           iTj(4,4,6) = 1;

% Joint 7 (6T7)
theta = deg2rad(90);
iTj(1,1,7) = cos(theta); iTj(1,2,7) = 0;          iTj(1,3,7) = sin(theta);  iTj(1,4,7) = 1.53;
iTj(2,1,7) = 0;          iTj(2,2,7) = 1;          iTj(2,3,7) = 0;           iTj(2,4,7) = 0;
iTj(3,1,7) = -sin(theta); iTj(3,2,7) = 0;         iTj(3,3,7) = cos(theta);  iTj(3,4,7) = 0;
iTj(4,1,7) = 0;          iTj(4,2,7) = 0;          iTj(4,3,7) = 0;           iTj(4,4,7) = 1;
end

