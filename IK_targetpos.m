clear
clc

syms theta1 theta2 theta3

X = 0.7719;
Y = 0.3023;
Z = 0.6;

eq1 = 0.4*cos(theta1) + 0.3*cos(theta1+theta2) + ...
      0.15*cos(theta1+theta2+theta3) == X;

eq2 = 0.4*sin(theta1) + 0.3*sin(theta1+theta2) + ...
      0.15*sin(theta1+theta2+theta3) == Y;

eq3 = theta1 + theta2 + theta3 == deg2rad(45);

sol = vpasolve([eq1, eq2, eq3], [theta1, theta2, theta3], ...
               [deg2rad(10), deg2rad(15), deg2rad(20)]);

theta1_sol = rad2deg(double(sol.theta1));
theta2_sol = rad2deg(double(sol.theta2));
theta3_sol = rad2deg(double(sol.theta3));

fprintf('\nInverse Kinematics Solution\n');
fprintf('---------------------------\n');
fprintf('Target Position:\n');
fprintf('X = %.4f m\n', X);
fprintf('Y = %.4f m\n', Y);
fprintf('Z = %.2f m (constant)\n\n', Z);

fprintf('Joint Angles:\n');
fprintf('theta1 = %.2f deg\n', theta1_sol);
fprintf('theta2 = %.2f deg\n', theta2_sol);
fprintf('theta3 = %.2f deg\n', theta3_sol);




