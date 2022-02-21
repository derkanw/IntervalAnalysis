A = kinterval([3, 5; -1, -3], [4, 6; 1, 1]);
b1 = kinterval([-3; -1], [3; 2]);
b2 = kinterval([-3; -1], [4; 2]);

xi1 = [0, 0.5, 0.75, 0.8889, 0.5, 0.2, 0, -0.75, -0.8235, 0; 0.3333, 0.1667, 0, -0.1111, -0.5, -0.6, -0.5, 0, 0.0588, 0.3333];
xi2 = [0, 1, 0.5, 0.2, 0, -0.75, -0.8236, 0; 0.3333, 0, -0.5, -0.6, -0.5, 0, 0.0588, 0.3333];

[x1, opt1, history1] = subdiff(A, b1);

opt1.tau = 1;
opt1.max_iterations_num = 20;
[x2, opt2, history2] = subdiff(A, b2, opt1);
opt1.tau = 0.1;
opt1.max_iterations_num = 100;
[x3, opt3, history3] = subdiff(A, b2, opt1);

x1
x2
x3

neutonBox(history1, xi1, "The first matrix")
neutonBox(history2, xi2, "The second matrix with tau 1")
neutonBox(history3, xi2, "The second matrix with tau 0.1")
useRwid(history1, "The first matrix")
useRwid(history2, "The second matrix with tau 1")
useRwid(history3, "The second matrix with tau 0.1")