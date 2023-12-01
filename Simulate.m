function Simulate(qi, qf, jointype, numberOfLinks, build_tree, exerciseNo)

f = figure(); % To create seperate windows for each function call
ax = axes(); % Axis declaration
increment_size = 0.01; % Increment size
joint_reached = 0; % A variable to keep count of the number of joints that have reached their target

% Plot the initial configuration of the manipulator
 iTj_q = GetDirectGeometry(qi, build_tree, jointype); 
 [X Y Z] = GetCoordinates(numberOfLinks, iTj_q);
 plot3(ax, X', Y', Z', '-O');
title(exerciseNo);
xlim([-12 12]);
ylim([-12 12]);
zlim([-2 12]);
grid on
grid minor

% Pause the simulation for a short duration
pause(3)

for i = 1:300
    if (joint_reached < numberOfLinks)
        joint_reached = 0;
        iTj_q = GetDirectGeometry(qi, build_tree, jointype); % Get the relative transformations for the current joint variable values
        [X Y Z] = GetCoordinates(numberOfLinks, iTj_q); % Extract vectors describing the X, Y and Z coordinates of the links

        % Iterate through every link
        for j = 1:length(qf)
            % Compare the position of the link with its target and
            % increment or decrement accordingly
            if ((qi(j) - qf(j)) <= -0.015)
                qi(j) = qi(j) + increment_size;
            elseif ((qi(j) - qf(j)) >= 0.015)
                qi(j) = qi(j) - increment_size;
            end

            % See if the current joint has reached its target and increment
            % joint_reached if so
            if ((qi(j) >= qf(j)) && (qf(j) > 0))
                joint_reached = joint_reached + 1;
            elseif ((qi(j) <= qf(j)) && (qf(j) < 0))
                joint_reached = joint_reached + 1;
            elseif ((qf(j) == 0) && (qi(j) == 0))
                joint_reached = joint_reached + 1;
            end
        end
    end

    % Plot the lines for the current set of coordinates
    plot3(ax, X', Y', Z', '-O');
    title(exerciseNo);
    xlim([-12 12]);
    ylim([-12 12]);
    zlim([-2 12]);
    grid on
    grid minor

    % Set a time interval between each successive loop
    pause(0.01);

    %Break the loop if all joints have reached their target
    if (joint_reached == numberOfLinks)
            break;
    end
end
end