function Y = obj_fun(x)
% x = [15.0983072979273, 1000, 447.974854917024, 999.355608867438, 778.161870670466, 8.54206261656633e-05];
load('../data/par.mat');
load('../data/passive_suspension_data.mat');
Q0 = diag([x(1), x(2), x(3), x(4), x(4), x(4), x(4), x(5), x(5), x(5), x(5)]);
r = diag([x(6), x(6), x(6), x(6)]);
options = simset('Solver', 'ode4', 'FixedStep', '0.005');
try %% simulink仿真异常，返回一个极大值
    [K1, K2] = calculate_lqr(Q0, r, A, B, E, C, D, H);
    assignin('base', 'K1', K1);
    assignin('base', 'K2', K2);
    out = sim('../model/active.slx', [0, 40], options);
    Y = out.Y.Data;
    Y = permute(Y, [3, 1, 2]); % 将维度从 [11x1x8001] 变为 [8001x11x1]
    Y = squeeze(Y); % 去掉单一维度，变为 [8001x11]
    rms_Y = rms(Y);
    rms_Y_passive = rms(Y_passive);
    w = rms_Y ./ rms_Y_passive;
    penalty = [1, 1, 1, 1.30, 1.30, 1.30, 1.30, 1, 1, 1, 1]; % 惩罚阈值
    Y = sum(w) + sum(max(0, w-penalty)*3);
catch
    Y = 1e6;
end
end