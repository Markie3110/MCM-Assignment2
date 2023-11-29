%% Modelling and Control of Manipulator assignment 2: Manipulator Geometry and Direct kinematic
clc;
clear;
close all;
addpath('include');


%% 1.
% You will need to define all the model matrices, and fill the so called iTj matrices inside BuildTree() function 
% Be careful to define the z-axis coinciding with the joint rotation axis,
% and such that the positive rotation is the same as showed in the CAD model you received.
geom_model = BuildTree();

% Useful initizializations
numberOfLinks =  7;                   % number of manipulator's links.
linkType = 0;                         % boolean that specifies two possible link types: Rotational, Prismatic.
bri= zeros(3,numberOfLinks);        % Basic vector of i-th link w.r.t. base
bTi = zeros(4,4,numberOfLinks);     % Trasformation matrix i-th link w.r.t. base

% Initial joint configuration 
q = [0,0,0,0,0,0,0];
iTj = zeros(4,4,1);

% Q1.1 and Q1.2
jointype = zeros(7, 1);
%a
q = [0; 0; 0; 0; 0; 0; 0;];
iTj_q = GetDirectGeometry(q, geom_model, jointype);
disp('iTj_q Q1.1a:'); disp(iTj_q)

%b
q = [0; 0; 0; 0; 0; (pi/2); 0;];
iTj_q = GetDirectGeometry(q, geom_model, jointype);
disp('iTj_q Q1.1b:'); disp(iTj_q)

%c
q = [0; (pi/2); 0; -(pi/2); 0; 0; 0;];
iTj_q = GetDirectGeometry(q, geom_model, jointype);
disp('iTj_q Q1.1c:'); disp(iTj_q)

%d
q = [(pi/4); (pi/2); -(pi/8); -(pi/2); (pi/4); (2/(3*pi)); 0;];
iTj_q = GetDirectGeometry(q, geom_model, jointype);
disp('iTj_q Q1.1d:'); disp(iTj_q)

%% 

%Q1.3
geom_model = BuildTree();
numberOfLinks = 7;

% Taking an arbitrary angular input 
q = [(pi/4); (pi/2); -(pi/8); -(pi/2); (pi/4); (2/(3*pi)); 0;];
iTj_q = GetDirectGeometry(q, geom_model, jointype);

%a
for i =1:numberOfLinks
    bTi(:,:,i)= GetTransformationWrtBase(iTj_q, i);
end
disp("Q1.3 a");
fprintf("Transformations of all joints w.r.t. base: \n");
disp(bTi)

%b
disp("Q1.3 b");
fprintf("Transformations of each frame w.r.t to the others\n");
for i = 1:numberOfLinks
    for j = i:numberOfLinks
        if (i ~= j)
            iTj = GetFrameWrtFrame(i, j, iTj_q);
            fprintf("%iT%i: \n", i, j);
            disp(iTj)
        end
    end
end

%c
disp("Q1.3 c");
fprintf("Basic vector from base <0> to every frame\n");
for i = 1:numberOfLinks
    bri = GetBasicVectorWrtBase(iTj_q, i);
    fprintf("0r%i: \n", i);
    disp(bri)
end

%% 

% Q1.4
% Hint: use plot3() and line() matlab functions. 

% a
qi = [0; 0; 0; 0; 0; 0; 0;];
qf = [(pi/4); (pi/2); -(pi/8); -(pi/2); (pi/4); (2/(3*pi)); 0;];
jointype = zeros(7, 1);
Simulate(qi, qf, jointype, numberOfLinks, geom_model, "Q1.4 a");

% b
qi = [0; (pi/2); 0; -(pi/2); 0; 0; 0;];
qf = [0; 0; 0; 0; 0; 0; 0;];
jointype = zeros(7, 1);
Simulate(qi, qf, jointype, numberOfLinks, geom_model, "Q1.4 b");

% c
qi = [1.3; 0.1; 0.1; 1; 0.2; 0.3; 1.3;];
qf = [2; 2; 2; 2; 2; 2; 2;];
jointype = zeros(7, 1);
Simulate(qi, qf, jointype, numberOfLinks, geom_model, "Q1.4 c");

%% 

% Q1.5
qi = [1.3; 0.1; 0.1; 1; 0.2; 0.3; 1.3;];
qf = [0; 0; 0; 0; 0; 0; 0;];
jointype = zeros(7, 1);
for i = 1:length(qf)
    qf(i) = 2;
    chr = int2str(i);
    str = "Q1.5 - Joint " + chr + " actuation";
    Simulate(qi, qf, jointype, numberOfLinks, geom_model, str);
end


%% 

% Additional code - Kept in case alternate implementation needed
%axis([-800 800 -800 800 0 800]);
% qi = [0; 0; 0; 0; 0; 0; 0;];
% jointype = zeros(7, 1);
% iTj_q = GetDirectGeometry(qi, geom_model, jointype);
% qf = [(pi/4); (pi/2); -(pi/8); -(pi/2); (pi/4); (2/(3*pi)); 0;];
% for i = 1:length(qf)
%     iTj = DirectGeometry(qf(i), iTj_q(:,:,i), jointype(i));
%     iTj_q(:,:,i) = iTj;
%     [X Y Z] = GetCoordinates(numberOfLinks, iTj_q);
%     plot3(X', Y', Z', '-O');
%     xlim([-800 800]);
%     ylim([-800 800]);
%     zlim([0 800]);
%     grid on
%     grid minor
%     x = input("Wait");
% end
% plot3(X',Y',Z', "-O");
% xlim([-800 800]);
% ylim([-800 800]);
% zlim([0 800]);
% grid on
% grid minor


