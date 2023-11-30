% データ生成
num_lines = 5;  % 線の本数
num_points = 100;  % 各線の点の数
t = linspace(0, 10, num_points);  % 時間軸
geom_model = BuildTree();

% アニメーションの設定
figure;
axis tight manual;
xlabel('X軸');
ylabel('Y軸');
zlabel('Z軸');
title('線のアニメーション');
grid on;

for i = 1:numberOfSteps
%-------------------MOVE----------------------%
    q = (qf-qi)*i/numberOfSteps;
    biTei = GetDirectGeometry(q, geom_model, 0);
    for j =1:numberOfLinks
        r(:,i,j) = GetBasicVectorWrtBase(biTei,j);
    end
end

% アニメーションのフレームを表示するためのループ
for frame = 1:num_points
    % 各線の位置を更新
    x = rand(num_lines, 1);
    y = rand(num_lines, 1);
    z = rand(num_lines, 1);
    
    % 現在のプロットを削除
    clf;
    
    % 新しいデータをプロット
    plot3(x, y, z, 'LineWidth', 2);
    
    % 軸ラベル、グリッドなどの設定
    xlabel('X軸');
    ylabel('Y軸');
    zlabel('Z軸');
    title(['フレーム: ' num2str(frame)]);
    grid on;
    
    % グラフを更新してアニメーションを表示
    drawnow;
    
    % アニメーションが速すぎる場合は適宜一時停止
    pause(0.1);
end
