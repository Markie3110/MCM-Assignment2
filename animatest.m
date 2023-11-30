% データ生成
num_lines = 5;  % 線の本数
num_points = 100;  % 各線の点の数
t = linspace(0, 10, num_points);  % 時間軸
linkType = [0,0,0,0,0,0,0];         % boolean that specifies two possible link types: Rotational, Prismatic.
numberOfSteps = 100;
numberOfLinks = 7;
r = zeros(3, numberOfSteps,numberOfLinks);

% アニメーションの設定
figure;
axis tight manual;
xlabel('X axis');
ylabel('Y axis');
zlabel('Z axis');
xlim([-1, 1]);  % x軸の範囲
ylim([0, 1.5]);  % y軸の範囲
zlim([0, 1]);  % z軸の範囲
title('links moving');
grid on;

qi = [0, pi/2, 0, -pi/2, 0, 0, 0];
qf = [0, 0, 0, 0, 0, 0, 0];
rm = zeros(3, 50, numberOfLinks-1);

for i = 1:numberOfSteps
%-------------------MOVE----------------------%
    q = qi+ (qf-qi)*i/numberOfSteps;
    biTei = GetDirectGeometry(q, geom_model, linkType);
    for j =1:numberOfLinks
        r(:,i,j) = GetBasicVectorWrtBase(biTei,j);
    end
end
% アニメーションのフレームを表示するためのループ
for i = 1:numberOfSteps
       % 各線の位置を更新
       % 現在のプロットを削除
    clf;

for j = 1:6
    for point = 1:50
    rm(1, point,j) = r(1,i,j)+(r(1,i,j+1) - r(1,i,j))*point/50;
    rm(2, point, j) = r(2,i,j)+(r(2,i,j+1) - r(2,i,j))*point/50;
    rm(3, point, j) = r(3,i,j)+(r(3,i,j+1) - r(3,i,j))*point/50;
     % 新しいデータをプロット
    end
end
   
  plot3(rm(1,:,1),rm(2,:,1),rm(3,:,1),rm(1,:,2),rm(2,:,2),rm(3,:,2),rm(1,:,3),rm(2,:,3),rm(3,:,3),rm(1,:,4),rm(2,:,4),rm(3,:,4),rm(1,:,5),rm(2,:,5),rm(3,:,5),rm(1,:,6),rm(2,:,6),rm(3,:,6));
  hold on;
  % 3Dプロット
  for k = 1:numberOfLinks
  plot3(r(1,i,k), r(2,i,k), r(3,i,k), 'o', 'MarkerSize', 8);
  end
    % 軸ラベル、グリッドなどの設定
    xlabel('X axis');
    ylabel('Y axis');
    zlabel('Z axis');
   xlim([-0.1, 1]);  % x軸の範囲
ylim([0, 0.2]);  % y軸の範囲
zlim([0, 0.8]);  % z軸の範囲
    title(['frame: ' num2str(i)]);
    grid on;
    
    % グラフを更新してアニメーションを表示
    drawnow;
    
    % アニメーションが速すぎる場合は適宜一時停止
    pause(0.1);
end
