function [] = plot_()
close all;
pso = load('../data/pso.mat');
% 设置画图参数
LineWidth = 1;
FontSize = 7.5;
position = [3, 5, 7, 5.5];
% 设置颜色
myColor = {; ...
    [189, 049, 006]; ...
    [238, 190, 004]; ...
    [091, 115, 020]; ...
    [069, 075, 135]; ...
    [000, 000, 000]};
for i = 1:length(myColor)
    myColor{i} = myColor{i} / 255;
end
% 画图
figure(1);
plot(pso.time, pso.qt1, '-', 'LineWidth', LineWidth, 'Color', myColor{1});
grid on;
xlabel('\fontname{SimSun}时间\fontname{Times New Roman}/s');
ylabel('\fontname{SimSun}路面不平度\fontname{Times New Roman}/m');
set(gca, 'FontSize', FontSize);
set(gcf, 'unit', 'centimeters', 'position', position);
set(gca, 'LooseInset', get(gca, 'TightInset')); % 坐标区充满图窗
saveas(gcf, '../picture/仿真生成左前轮路面不平度.emf');

figure(2);
plot(1:11, 100*pso.w, '-o', 'LineWidth', LineWidth, 'Color', myColor{1});
hold on;
plot(1:11, 100*pso.w_raw, '-s', 'LineWidth', LineWidth, 'Color', myColor{2});
grid on;
xlabel('\fontname{SimSun}性能指标\fontname{Times New Roman}(y\fontname{SimSun}为\fontname{Times New Roman}Y\fontname{SimSun}向量的元素\fontname{Times New Roman})');
ylabel('\fontname{SimSun}降幅\fontname{Times New Roman}/%(\fontname{SimSun}负号表示增幅\fontname{Times New Roman})');
h1 = refline(0, 0); %辅助线
set(h1, 'color', myColor{3}, 'LineWidth', LineWidth); %辅助线颜色
legend('\fontname{SimSun}优化后', '\fontname{SimSun}未优化');
legend('boxoff');
legend('FontSize', FontSize, 'Location', 'northeast', 'NumColumns', 1);
% 自定义横坐标
xticks(1:11); % 设置横坐标刻度位置
xticklabels({'y_1', 'y_2', 'y_3', 'y_4', 'y_5', 'y_6', 'y_7', 'y_8', 'y_9', 'y_{10}', 'y_{11}'}); % 设置横坐标的标签
set(gca, 'ylim', [-100, 100]);
set(gca, 'FontSize', FontSize);
set(gcf, 'unit', 'centimeters', 'position', position);
set(gca, 'LooseInset', get(gca, 'TightInset')); % 坐标区充满图窗
saveas(gcf, '../picture/粒子群算法对性能指标改善效果.emf');
close all;


road = load('../data/road.mat');
% 画图
figure(1);
plot(road.time, road.real_road, '-', 'LineWidth', LineWidth, 'Color', myColor{1});
hold on;
plot(road.time, road.predict_road, '--', 'LineWidth', LineWidth, 'Color', myColor{2});
grid on;
xlabel('\fontname{SimSun}时间\fontname{Times New Roman}/s');
ylabel('\fontname{SimSun}路面不平度\fontname{Times New Roman}/m');
legend('\fontname{SimSun}左前真实值', '\fontname{SimSun}左前识别值');
legend('boxoff');
legend('FontSize', FontSize, 'Location', 'northeast', 'NumColumns', 1);
set(gca, 'ylim', [-0.02, 0.04]);
set(gca, 'FontSize', FontSize);
set(gcf, 'unit', 'centimeters', 'position', position);
set(gca, 'LooseInset', get(gca, 'TightInset')); % 坐标区充满图窗
saveas(gcf, '../picture/左前车轮处路面不平度识别效果.emf');
close all;

control = load('../data/control.mat');
% 画图
figure(1);
plot(1:3, control.rms_Y(1:3), '-o', 'LineWidth', LineWidth, 'Color', myColor{3});
hold on;
plot(1:3, control.rms_Y_passive(1:3), '-s', 'LineWidth', LineWidth, 'Color', myColor{4});
grid on;
xlabel('\fontname{SimSun}性能指标');
yyaxis left; %左侧y轴
ylabel('\fontname{SimSun}均方根值\fontname{Times New Roman}/(m\cdots^{-2})');
set(gca, 'ylim', [0.1, 0.5]);
yyaxis right; %右侧y轴
ylabel('\fontname{SimSun}均方根值\fontname{Times New Roman}/(rad\cdots^{-2})', 'Color', 'black');
set(gca, 'ylim', [0.1, 0.5], 'ycolor', 'black');
legend('\fontname{SimSun}主动悬架', '\fontname{SimSun}被动悬架');
legend('boxoff');
legend('FontSize', FontSize, 'Location', 'northeast', 'NumColumns', 1);
% 自定义横坐标
xticks(1:3); % 设置横坐标刻度位置
xticklabels({'y_1', 'y_2', 'y_3'}); % 设置横坐标的标签
set(gca, 'xlim', [0.5, 3.5]);
set(gca, 'FontSize', FontSize);
set(gcf, 'unit', 'centimeters', 'position', position);
set(gca, 'LooseInset', get(gca, 'TightInset')); % 坐标区充满图窗
saveas(gcf, '../picture/不同悬架前三个性能均方根值.emf');

figure(2);
plot(4:11, control.rms_Y(4:11), '-o', 'LineWidth', LineWidth, 'Color', myColor{3});
hold on;
plot(4:11, control.rms_Y_passive(4:11), '-s', 'LineWidth', LineWidth, 'Color', myColor{4});
grid on;
xlabel('\fontname{SimSun}性能指标');
ylabel('\fontname{SimSun}均方根值\fontname{Times New Roman}/m');
% set(gca,'ylim',[0.1 0.5]);
legend('\fontname{SimSun}主动悬架', '\fontname{SimSun}被动悬架');
legend('boxoff');
legend('FontSize', FontSize, 'Location', 'northeast', 'NumColumns', 1);
% 自定义横坐标
xticks(4:11); % 设置横坐标刻度位置
xticklabels({'y_4', 'y_5', 'y_6', 'y_7', 'y_8', 'y_9', 'y_{10}', 'y_{11}'}); % 设置横坐标的标签
set(gca, 'xlim', [3.5, 11.5]);
set(gca, 'FontSize', FontSize);
set(gcf, 'unit', 'centimeters', 'position', position);
set(gca, 'LooseInset', get(gca, 'TightInset')); % 坐标区充满图窗
saveas(gcf, '../picture/不同悬架后八个性能均方根值.emf');

figure(3);
plot(control.time, control.u(:, 1), '-', 'LineWidth', LineWidth, 'Color', myColor{1});
grid on;
xlabel('\fontname{SimSun}时间\fontname{Times New Roman}/s');
ylabel('\fontname{SimSun}主动力\fontname{Times New Roman}/N');
% set(gca,'ylim',[0.1 0.5]);
set(gca, 'FontSize', FontSize);
set(gcf, 'unit', 'centimeters', 'position', position);
set(gca, 'LooseInset', get(gca, 'TightInset')); % 坐标区充满图窗
saveas(gcf, '../picture/左前电机输出的主动力.emf');
close all;
end