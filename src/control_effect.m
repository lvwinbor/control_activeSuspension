function [] = control_effect()
options = simset('Solver', 'ode4', 'FixedStep', '0.005');
set_param('active_with_narx_and_can', 'SimulationMode', 'normal');
set_param('active_with_narx_and_can', 'EnablePacing', 'on');
set_param('active_with_narx_and_can', 'PacingRate', '1');
out = sim('../model/active_with_narx_and_can.slx', [0, 40], options);
Y = out.Y.Data;
Y = permute(Y, [3, 1, 2]); % 将维度从 [11x1x8001] 变为 [8001x11x1]
Y = squeeze(Y); % 去掉单一维度，变为 [8001x11]
Y = Y(6001:8001, :);
rms_Y = rms(Y);
load('../data/passive_suspension_data.mat');
Y_passive = Y_passive(6001:8001, :);
rms_Y_passive = rms(Y_passive);
u = out.u.Data;
u = permute(u, [3, 1, 2]); % 将维度从 [4x1x8001] 变为 [8001x4x1]
u = squeeze(u); % 去掉单一维度，变为 [8001x4]
u = u(6001:8001, :);
time = out.u.Time(6001:8001);
save('../data/control.mat', 'rms_Y', 'rms_Y_passive', 'u', 'time');
end