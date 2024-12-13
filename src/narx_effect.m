function [] = narx_effect()
options = simset('Solver', 'ode4', 'FixedStep', '0.005');
out = sim('../model/active_with_narx.slx', [0, 40], options);
time = out.qt1.Time(6001:8001); % 时间
real_road = out.qt1.Data(6001:8001); % 真实路面
predict_road = out.qp1.Data(6001:8001); % 识别的路面
diff = real_road - predict_road;
mean_squared_diff = mean(diff .^ 2);
rmse = sqrt(mean_squared_diff);
save('../data/road.mat', 'rmse', 'time', 'real_road', 'predict_road');
end