function [] = pso_effect()
load('../data/par.mat');
load('../data/passive_suspension_data.mat');
Q0 = diag([15, 1000, 448, 999, 999, 999, 999, 778, 778, 778, 778]);
r = diag([8.54e-5, 8.54e-5, 8.54e-5, 8.54e-5]);
[K1, K2] = calculate_lqr(Q0, r, A, B, E, C, D, H);
options = simset('Solver', 'ode4', 'FixedStep', '0.005');
assignin('base', 'K1', K1);
assignin('base', 'K2', K2);
out = sim('../model/active.slx', [0, 40], options);
Y = out.Y.Data;
Y = permute(Y, [3, 1, 2]); % 将维度从 [11x1x8001] 变为 [8001x11x1]
Y = squeeze(Y); % 去掉单一维度，变为 [8001x11]
rms_Y = rms(Y);
rms_Y_passive = rms(Y_passive);
w = (rms_Y_passive - rms_Y) ./ rms_Y_passive;
Q0 = diag([100, 1, 80, 30, 30, 30, 30, 1000, 1000, 1000, 1000]);
r = diag([3.5e-5, 3.5e-5, 3.5e-5, 3.5e-5]);
[K1, K2] = calculate_lqr(Q0, r, A, B, E, C, D, H);
options = simset('Solver', 'ode4', 'FixedStep', '0.005');
assignin('base', 'K1', K1);
assignin('base', 'K2', K2);
out = sim('../model/active.slx', [0, 40], options);
Y_raw = out.Y.Data;
Y_raw = permute(Y_raw, [3, 1, 2]); % 将维度从 [11x1x8001] 变为 [8001x11x1]
Y_raw = squeeze(Y_raw); % 去掉单一维度，变为 [8001x11]
rms_Y_raw = rms(Y_raw);
w_raw = (rms_Y_passive - rms_Y_raw) ./ rms_Y_passive;
time = out.Y.Time;
qt1 = out.qt1.Data;
save('../data/pso.mat', 'w', 'w_raw', 'time', 'qt1');
end