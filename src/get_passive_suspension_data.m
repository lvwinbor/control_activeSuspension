function [] = get_passive_suspension_data()

options = simset('Solver', 'ode4', 'FixedStep', '0.005');
out = sim('../model/passive.slx', [0, 40], options);
Y_passive = out.Y.Data;
Y_passive = permute(Y_passive, [3, 1, 2]); % 将维度从 [11x1x8001] 变为 [8001x11x1]
Y_passive = squeeze(Y_passive); % 去掉单一维度，变为 [8001x11]
save('../data/passive_suspension_data.mat', 'Y_passive');
end