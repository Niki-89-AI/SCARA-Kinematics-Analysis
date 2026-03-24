syms theta1 theta2 theta3 real

% 1. DEFINE DH PARAMETERS [theta, d, a, alpha]
% theta: joint variables, d: link offset, a: link length, alpha: link twist
DH = [theta1, 0.2,  0.4,  0;
      theta2, 0.25, 0.3,  0;
      theta3, 0.15, 0.15, 0];

% 2. COMPUTE TRANSFORMATION MATRICES
T_0_3 = eye(4);
for i = 1:3
    q = DH(i,1); d = DH(i,2); a = DH(i,3); alpha = DH(i,4);
    
    % Standard DH Transformation Matrix [cite: 6]
    T_link = [cos(q), -sin(q)*cos(alpha),  sin(q)*sin(alpha), a*cos(q);
              sin(q),  cos(q)*cos(alpha), -cos(q)*sin(alpha), a*sin(q);
              0,       sin(alpha),         cos(alpha),        d;
              0,       0,                  0,                 1];
          
    T_0_3 = T_0_3 * T_link;
end

% Simplify position equations for Q1.1 
X_eq = simplify(T_0_3(1,4));
Y_eq = simplify(T_0_3(2,4));
Z_eq = simplify(T_0_3(3,4));


% 3. THETA INPUT (Inputs for Q1.1 and Q1.2)
test_angles_deg = [10, 15, 20]; 

% Convert to radians for calculation
test_angles_rad = deg2rad(test_angles_deg);

% 4. NUMERICAL OUTPUT
X_val = double(subs(X_eq, {theta1, theta2, theta3}, test_angles_rad));
Y_val = double(subs(Y_eq, {theta1, theta2, theta3}, test_angles_rad));
Z_val = double(subs(Z_eq, {theta1, theta2, theta3}, test_angles_rad));

fprintf('--- Forward Kinematics Results ---\n');
fprintf('General Equations:\n');
fprintf('X = %s\n', char(X_eq));
fprintf('Y = %s\n', char(Y_eq));
fprintf('Z = %s\n\n', char(Z_eq));

fprintf('Results for angles [%.1f, %.1f, %.1f]:\n', test_angles_deg);
fprintf('X: %.4f m\n', X_val);
fprintf('Y: %.4f m\n', Y_val);
fprintf('Z: %.4f m\n', Z_val);