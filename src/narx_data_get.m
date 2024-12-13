function [] = narx_data_get()

options = simset('Solver', 'ode4', 'FixedStep', '0.005');
out = sim('../model/active.slx', [0, 30], options);
for i = 1:21
    field_name = sprintf('x%d', i);
    input_data(:, i) = reshape(out.(field_name).Data, 6001, 1);
end
for i = 1:4
    field_name = sprintf('y%d', i);
    target_data(:, i) = reshape(out.(field_name).Data, 6001, 1);
end
save('../data/narx_data.mat', 'input_data', 'target_data');
end