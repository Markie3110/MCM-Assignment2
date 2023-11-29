function Simulate(qi, qf, jointype, numberOfLinks, build_tree, exerciseNo)

f = figure();
ax = axes();
increment_size = 0.01;
joint_reached = 0;
iTj_q_original = GetDirectGeometry(qi, build_tree, jointype); % Initial matrix of transformation matrices
for i = 1:300
    if (joint_reached < numberOfLinks)
        joint_reached = 0;
        iTj_q = GetDirectGeometry(qi, iTj_q_original, jointype);
        [X Y Z] = GetCoordinates(numberOfLinks, iTj_q);
        for j = 1:length(qf)
            if ((qi(j) - qf(j)) < 0)
                qi(j) = qi(j) + increment_size;
            elseif ((qi(j) - qf(j)) > 0)
                qi(j) = qi(j) - increment_size;
            end
            if ((qi(j) >= qf(j)) && (qf(j) > 0))
                joint_reached = joint_reached + 1;
            elseif ((qi(j) <= qf(j)) && (qf(j) < 0))
                joint_reached = joint_reached + 1;
            elseif ((qf(j) == 0) && (qi(j) == 0))
                joint_reached = joint_reached + 1;
            end
        end
    end
    plot3(ax, X', Y', Z', '-O');
    title(exerciseNo);
    xlim([-1200 1200]);
    ylim([-1200 1200]);
    zlim([0 1200]);
    grid on
    grid minor
    pause(0.01);
    if (joint_reached == numberOfLinks)
            break;
    end
end
plot3(ax, X',Y',Z', "-O");
title(exerciseNo);
xlim([-1200 1200]);
ylim([-1200 1200]);
zlim([0 1200]);
grid on

end