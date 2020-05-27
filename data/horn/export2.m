lambda = 1;
k = 2 * pi() / lambda;
a = 1.5;
b = 1.5;
A_min = 2;
A_max = 10;
B_min = 2;
B_max = 10;
d_min = 1;
d_max = 6;
theta_min = 0;
theta_max = pi() / 4;
N = 50;

a_min_test = 2;
a_max_test = 10;
b_min_test = 2;
b_max_test = 10;
t_min_test = 0;
t_max_test = pi() / 4;
N_test = 200;

num = 64;
R = 10;
files = 300;

processbar = waitbar(0, 'processing output');
for i = 1:1:files
    train_data = generate_train_data2(a, b, d_min, d_max, A_min, A_max, B_min, B_max, theta_min, theta_max, N, R, k, num);
    filename = sprintf('train_val_data%d.csv', i);
    csvwrite(filename, train_data);
    waitbar(i/files)
end
close(processbar)

test_data = generate_test_data(a_min_test, a_max_test, b_min_test, b_max_test, t_min_test, t_max_test, N_test, R, k, num);
csvwrite('test_data.csv', test_data);