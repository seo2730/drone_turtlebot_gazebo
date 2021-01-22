% The propellers thrust and drag coefficients
Kt = 0.0019; Kd = 0.28*10^-6;

% The friction's aerodynamic coefficients
Kfax = 0.00056; Kfay = 0.00056; Kfaz = 0.00064;

% The rotor ineria
Jr = 28.4*10^-6;

% Ineria matrix
Ix = 0.0104; Iy = 0.0104; Iz = 0.0284;

% Length from each motor to the drone & mass of the drone
l = 0.24; m = 1.05;

% Premise variables : Roll Pitch Yaw angular velocity(degree/s^2)
Phi_dot_min = 0; Phi_dot_max = 30;
Theta_dot_min = 0; Theta_dot_max = 30;
Psi_dot_min = 0; Psi_dot_max = 30;

den1 = Phi_dot_max - Phi_dot_min;
den2 = Theta_dot_max - Theta_dot_min;
den3 = Psi_dot_max - Psi_dot_min;

% Fuzzy Rule 1
A1 = [0 0 0                        1                      0                        0;
      0 0 0                        0                      1                        0;
      0 0 0                        0                      0                        1;
      0 0 0     -Kfax/Ix*Phi_dot_min                      0 (Iy-Iz)/Ix*Theta_dot_min;
      0 0 0                        0 -Kfay/Iy*Theta_dot_min   (Iz-Ix)/Iy*Phi_dot_min;
      0 0 0 (Ix-Iy)/Iz*Theta_dot_min                      0   -Kfaz/Iz*Psi_dot_min];

B1 = [                  0                    0                   0                    0        0        0       0        0;
                        0                    0                   0                    0        0        0       0        0;
                        0                    0                   0                    0        0        0       0        0;
      Jr/Ix*Theta_dot_min -Jr/Ix*Theta_dot_min Jr/Ix*Theta_dot_min -Jr/Ix*Theta_dot_min -l*Kt/Ix        0 l*Kt/Ix        0;
       -Jr/Iy*Phi_dot_min    Jr/Iy*Phi_dot_min  -Jr/Iy*Phi_dot_min    Jr/Iy*Phi_dot_min        0 -l*Kt/Iy       0  l*Kt/Iy;
                        0                    0                   0                    0  l*Kd/Iz -l*Kd/Iz l*Kd/Iz -l*Kd/Iz];
% Fuzzy Rule 2
A2 = [0 0 0                        1                      0                        0;
      0 0 0                        0                      1                        0;
      0 0 0                        0                      0                        1;
      0 0 0     -Kfax/Ix*Phi_dot_min                      0 (Iy-Iz)/Ix*Theta_dot_min;
      0 0 0                        0 -Kfay/Iy*Theta_dot_min   (Iz-Ix)/Iy*Phi_dot_min;
      0 0 0 (Ix-Iy)/Iz*Theta_dot_min                      0   -Kfaz/Iz*Psi_dot_max];

B2 = [                  0                    0                   0                    0        0        0       0        0;
                        0                    0                   0                    0        0        0       0        0;
                        0                    0                   0                    0        0        0       0        0;
      Jr/Ix*Theta_dot_min -Jr/Ix*Theta_dot_min Jr/Ix*Theta_dot_min -Jr/Ix*Theta_dot_min -l*Kt/Ix        0 l*Kt/Ix        0;
       -Jr/Iy*Phi_dot_min    Jr/Iy*Phi_dot_min  -Jr/Iy*Phi_dot_min    Jr/Iy*Phi_dot_min        0 -l*Kt/Iy       0  l*Kt/Iy;
                        0                    0                   0                    0  l*Kd/Iz -l*Kd/Iz l*Kd/Iz -l*Kd/Iz];
% Fuzzy Rule 3
A3 = [0 0 0                        1                      0                        0;
      0 0 0                        0                      1                        0;
      0 0 0                        0                      0                        1;
      0 0 0     -Kfax/Ix*Phi_dot_min                      0 (Iy-Iz)/Ix*Theta_dot_max;
      0 0 0                        0 -Kfay/Iy*Theta_dot_max   (Iz-Ix)/Iy*Phi_dot_min;
      0 0 0 (Ix-Iy)/Iz*Theta_dot_max                      0   -Kfaz/Iz*Psi_dot_min];

B3 = [                  0                    0                   0                    0        0        0       0        0;
                        0                    0                   0                    0        0        0       0        0;
                        0                    0                   0                    0        0        0       0        0;
      Jr/Ix*Theta_dot_max -Jr/Ix*Theta_dot_max Jr/Ix*Theta_dot_max -Jr/Ix*Theta_dot_max -l*Kt/Ix        0 l*Kt/Ix        0;
       -Jr/Iy*Phi_dot_min    Jr/Iy*Phi_dot_min  -Jr/Iy*Phi_dot_min    Jr/Iy*Phi_dot_min        0 -l*Kt/Iy       0  l*Kt/Iy;
                        0                    0                   0                    0  l*Kd/Iz -l*Kd/Iz l*Kd/Iz -l*Kd/Iz];
% Fuzzy Rule 4
A4 = [0 0 0                        1                      0                        0;
      0 0 0                        0                      1                        0;
      0 0 0                        0                      0                        1;
      0 0 0     -Kfax/Ix*Phi_dot_max                      0 (Iy-Iz)/Ix*Theta_dot_min;
      0 0 0                        0 -Kfay/Iy*Theta_dot_min   (Iz-Ix)/Iy*Phi_dot_max;
      0 0 0 (Ix-Iy)/Iz*Theta_dot_min                      0   -Kfaz/Iz*Psi_dot_min];

B4 = [                  0                    0                   0                    0        0        0       0        0;
                        0                    0                   0                    0        0        0       0        0;
                        0                    0                   0                    0        0        0       0        0;
      Jr/Ix*Theta_dot_min -Jr/Ix*Theta_dot_min Jr/Ix*Theta_dot_min -Jr/Ix*Theta_dot_min -l*Kt/Ix        0 l*Kt/Ix        0;
       -Jr/Iy*Phi_dot_max    Jr/Iy*Phi_dot_max  -Jr/Iy*Phi_dot_max    Jr/Iy*Phi_dot_max        0 -l*Kt/Iy       0  l*Kt/Iy;
                        0                    0                   0                    0  l*Kd/Iz -l*Kd/Iz l*Kd/Iz -l*Kd/Iz];
% Fuzzy Rule 5
A5 = [0 0 0                        1                      0                        0;
      0 0 0                        0                      1                        0;
      0 0 0                        0                      0                        1;
      0 0 0     -Kfax/Ix*Phi_dot_max                      0 (Iy-Iz)/Ix*Theta_dot_max;
      0 0 0                        0 -Kfay/Iy*Theta_dot_max   (Iz-Ix)/Iy*Phi_dot_max;
      0 0 0 (Ix-Iy)/Iz*Theta_dot_max                      0   -Kfaz/Iz*Psi_dot_min];

B5 = [                  0                    0                   0                    0        0        0       0        0;
                        0                    0                   0                    0        0        0       0        0;
                        0                    0                   0                    0        0        0       0        0;
      Jr/Ix*Theta_dot_max -Jr/Ix*Theta_dot_max Jr/Ix*Theta_dot_max -Jr/Ix*Theta_dot_max -l*Kt/Ix        0 l*Kt/Ix        0;
       -Jr/Iy*Phi_dot_max    Jr/Iy*Phi_dot_max  -Jr/Iy*Phi_dot_max    Jr/Iy*Phi_dot_max        0 -l*Kt/Iy       0  l*Kt/Iy;
                        0                    0                   0                    0  l*Kd/Iz -l*Kd/Iz l*Kd/Iz -l*Kd/Iz];
% Fuzzy Rule 6
A6 = [0 0 0                        1                      0                        0;
      0 0 0                        0                      1                        0;
      0 0 0                        0                      0                        1;
      0 0 0     -Kfax/Ix*Phi_dot_max                      0 (Iy-Iz)/Ix*Theta_dot_min;
      0 0 0                        0 -Kfay/Iy*Theta_dot_max   (Iz-Ix)/Iy*Phi_dot_min;
      0 0 0 (Ix-Iy)/Iz*Theta_dot_min                      0   -Kfaz/Iz*Psi_dot_max];

B6 = [                  0                    0                   0                    0        0        0       0        0;
                        0                    0                   0                    0        0        0       0        0;
                        0                    0                   0                    0        0        0       0        0;
      Jr/Ix*Theta_dot_min -Jr/Ix*Theta_dot_min Jr/Ix*Theta_dot_min -Jr/Ix*Theta_dot_min -l*Kt/Ix        0 l*Kt/Ix        0;
       -Jr/Iy*Phi_dot_max    Jr/Iy*Phi_dot_max  -Jr/Iy*Phi_dot_max    Jr/Iy*Phi_dot_max        0 -l*Kt/Iy       0  l*Kt/Iy;
                        0                    0                   0                    0  l*Kd/Iz -l*Kd/Iz l*Kd/Iz -l*Kd/Iz];
% Fuzzy Rule 7
A7 = [0 0 0                        1                      0                        0;
      0 0 0                        0                      1                        0;
      0 0 0                        0                      0                        1;
      0 0 0     -Kfax/Ix*Phi_dot_min                      0 (Iy-Iz)/Ix*Theta_dot_max;
      0 0 0                        0 -Kfay/Iy*Theta_dot_max   (Iz-Ix)/Iy*Phi_dot_min;
      0 0 0 (Ix-Iy)/Iz*Theta_dot_max                      0   -Kfaz/Iz*Psi_dot_max];

B7 = [                  0                    0                   0                    0        0        0       0        0;
                        0                    0                   0                    0        0        0       0        0;
                        0                    0                   0                    0        0        0       0        0;
      Jr/Ix*Theta_dot_max -Jr/Ix*Theta_dot_max Jr/Ix*Theta_dot_max -Jr/Ix*Theta_dot_max -l*Kt/Ix        0 l*Kt/Ix        0;
       -Jr/Iy*Phi_dot_min    Jr/Iy*Phi_dot_min  -Jr/Iy*Phi_dot_min    Jr/Iy*Phi_dot_min        0 -l*Kt/Iy       0  l*Kt/Iy;
                        0                    0                   0                    0  l*Kd/Iz -l*Kd/Iz l*Kd/Iz -l*Kd/Iz];
% Fuzzy Rule 8
A8 = [0 0 0                        1                      0                        0;
      0 0 0                        0                      1                        0;
      0 0 0                        0                      0                        1;
      0 0 0     -Kfax/Ix*Phi_dot_max                      0 (Iy-Iz)/Ix*Theta_dot_max;
      0 0 0                        0 -Kfay/Iy*Theta_dot_max   (Iz-Ix)/Iy*Phi_dot_max;
      0 0 0 (Ix-Iy)/Iz*Theta_dot_max                      0   -Kfaz/Iz*Psi_dot_max];

B8 = [                  0                    0                   0                    0        0        0       0        0;
                        0                    0                   0                    0        0        0       0        0;
                        0                    0                   0                    0        0        0       0        0;
      Jr/Ix*Theta_dot_max -Jr/Ix*Theta_dot_max Jr/Ix*Theta_dot_max -Jr/Ix*Theta_dot_max -l*Kt/Ix        0 l*Kt/Ix        0;
       -Jr/Iy*Phi_dot_max    Jr/Iy*Phi_dot_max  -Jr/Iy*Phi_dot_max    Jr/Iy*Phi_dot_max        0 -l*Kt/Iy       0  l*Kt/Iy;
                        0                    0                   0                    0  l*Kd/Iz -l*Kd/Iz l*Kd/Iz -l*Kd/Iz];
                    
% LMI
setlmis([])

n = 6;
m = 8;
X = lmivar(1, [n, 1]);  % A1*X + X*A1'    
Y1 = lmivar(2, [m, n]); % -B1*Y1 - Y1'*B1'
Y2 = lmivar(2, [m, n]);
Y3 = lmivar(2, [m, n]);
Y4 = lmivar(2, [m, n]);
Y5 = lmivar(2, [m, n]);
Y6 = lmivar(2, [m, n]);
Y7 = lmivar(2, [m, n]);
Y8 = lmivar(2, [m, n]);

% LMI condition 1
lmiterm([1 1 1 X], A1, 1, 's')      
lmiterm([1 1 1 Y1], -B1, 1, 's')    
lmiterm([1 1 1 X], A1, 1, 's')      
lmiterm([1 1 1 Y2], -B1, 1, 's')    
lmiterm([1 1 1 X], A1, 1, 's')      
lmiterm([1 1 1 Y3], -B1, 1, 's')   
lmiterm([1 1 1 X], A1, 1, 's')      
lmiterm([1 1 1 Y4], -B1, 1, 's')   
lmiterm([1 1 1 X], A1, 1, 's')      
lmiterm([1 1 1 Y5], -B1, 1, 's')   
lmiterm([1 1 1 X], A1, 1, 's')      
lmiterm([1 1 1 Y6], -B1, 1, 's')   
lmiterm([1 1 1 X], A1, 1, 's')      
lmiterm([1 1 1 Y7], -B1, 1, 's')   
lmiterm([1 1 1 X], A1, 1, 's')      
lmiterm([1 1 1 Y8], -B1, 1, 's')   

% LMI condition 2
lmiterm([1 1 1 X], A2, 1, 's')      
lmiterm([1 1 1 Y1], -B2, 1, 's')    
lmiterm([1 1 1 X], A2, 1, 's')      
lmiterm([1 1 1 Y2], -B2, 1, 's')    
lmiterm([1 1 1 X], A2, 1, 's')      
lmiterm([1 1 1 Y3], -B2, 1, 's')   
lmiterm([1 1 1 X], A2, 1, 's')      
lmiterm([1 1 1 Y4], -B2, 1, 's')   
lmiterm([1 1 1 X], A2, 1, 's')      
lmiterm([1 1 1 Y5], -B2, 1, 's')   
lmiterm([1 1 1 X], A2, 1, 's')      
lmiterm([1 1 1 Y6], -B2, 1, 's')   
lmiterm([1 1 1 X], A2, 1, 's')      
lmiterm([1 1 1 Y7], -B2, 1, 's')   
lmiterm([1 1 1 X], A2, 1, 's')      
lmiterm([1 1 1 Y8], -B2, 1, 's')

% LMI condition 3
lmiterm([1 1 1 X], A3, 1, 's')      
lmiterm([1 1 1 Y1], -B3, 1, 's')    
lmiterm([1 1 1 X], A3, 1, 's')      
lmiterm([1 1 1 Y2], -B3, 1, 's')    
lmiterm([1 1 1 X], A3, 1, 's')      
lmiterm([1 1 1 Y3], -B3, 1, 's')   
lmiterm([1 1 1 X], A3, 1, 's')      
lmiterm([1 1 1 Y4], -B3, 1, 's')   
lmiterm([1 1 1 X], A3, 1, 's')      
lmiterm([1 1 1 Y5], -B3, 1, 's')   
lmiterm([1 1 1 X], A3, 1, 's')      
lmiterm([1 1 1 Y6], -B3, 1, 's')   
lmiterm([1 1 1 X], A3, 1, 's')      
lmiterm([1 1 1 Y7], -B3, 1, 's')   
lmiterm([1 1 1 X], A3, 1, 's')      
lmiterm([1 1 1 Y8], -B3, 1, 's')

% LMI condition 4
lmiterm([1 1 1 X], A4, 1, 's')      
lmiterm([1 1 1 Y1], -B4, 1, 's')    
lmiterm([1 1 1 X], A4, 1, 's')      
lmiterm([1 1 1 Y2], -B4, 1, 's')    
lmiterm([1 1 1 X], A4, 1, 's')      
lmiterm([1 1 1 Y3], -B4, 1, 's')   
lmiterm([1 1 1 X], A4, 1, 's')      
lmiterm([1 1 1 Y4], -B4, 1, 's')   
lmiterm([1 1 1 X], A4, 1, 's')      
lmiterm([1 1 1 Y5], -B4, 1, 's')   
lmiterm([1 1 1 X], A4, 1, 's')      
lmiterm([1 1 1 Y6], -B4, 1, 's')   
lmiterm([1 1 1 X], A4, 1, 's')      
lmiterm([1 1 1 Y7], -B4, 1, 's')   
lmiterm([1 1 1 X], A4, 1, 's')      
lmiterm([1 1 1 Y8], -B4, 1, 's')

% LMI condition 5
lmiterm([1 1 1 X], A5, 1, 's')      
lmiterm([1 1 1 Y1], -B5, 1, 's')    
lmiterm([1 1 1 X], A5, 1, 's')      
lmiterm([1 1 1 Y2], -B5, 1, 's')    
lmiterm([1 1 1 X], A5, 1, 's')      
lmiterm([1 1 1 Y3], -B5, 1, 's')   
lmiterm([1 1 1 X], A5, 1, 's')      
lmiterm([1 1 1 Y4], -B5, 1, 's')   
lmiterm([1 1 1 X], A5, 1, 's')      
lmiterm([1 1 1 Y5], -B5, 1, 's')   
lmiterm([1 1 1 X], A5, 1, 's')      
lmiterm([1 1 1 Y6], -B5, 1, 's')   
lmiterm([1 1 1 X], A5, 1, 's')      
lmiterm([1 1 1 Y7], -B5, 1, 's')   
lmiterm([1 1 1 X], A5, 1, 's')      
lmiterm([1 1 1 Y8], -B5, 1, 's')

% LMI condition 6
lmiterm([1 1 1 X], A6, 1, 's')      
lmiterm([1 1 1 Y1], -B6, 1, 's')    
lmiterm([1 1 1 X], A6, 1, 's')      
lmiterm([1 1 1 Y2], -B6, 1, 's')    
lmiterm([1 1 1 X], A6, 1, 's')      
lmiterm([1 1 1 Y3], -B6, 1, 's')   
lmiterm([1 1 1 X], A6, 1, 's')      
lmiterm([1 1 1 Y4], -B6, 1, 's')   
lmiterm([1 1 1 X], A6, 1, 's')      
lmiterm([1 1 1 Y5], -B6, 1, 's')   
lmiterm([1 1 1 X], A6, 1, 's')      
lmiterm([1 1 1 Y6], -B6, 1, 's')   
lmiterm([1 1 1 X], A6, 1, 's')      
lmiterm([1 1 1 Y7], -B6, 1, 's')   
lmiterm([1 1 1 X], A6, 1, 's')      
lmiterm([1 1 1 Y8], -B6, 1, 's')

% LMI condition 7
lmiterm([1 1 1 X], A7, 1, 's')      
lmiterm([1 1 1 Y1], -B7, 1, 's')    
lmiterm([1 1 1 X], A7, 1, 's')      
lmiterm([1 1 1 Y2], -B7, 1, 's')    
lmiterm([1 1 1 X], A7, 1, 's')      
lmiterm([1 1 1 Y3], -B7, 1, 's')   
lmiterm([1 1 1 X], A7, 1, 's')      
lmiterm([1 1 1 Y4], -B7, 1, 's')   
lmiterm([1 1 1 X], A7, 1, 's')      
lmiterm([1 1 1 Y5], -B7, 1, 's')   
lmiterm([1 1 1 X], A7, 1, 's')      
lmiterm([1 1 1 Y6], -B7, 1, 's')   
lmiterm([1 1 1 X], A7, 1, 's')      
lmiterm([1 1 1 Y7], -B7, 1, 's')   
lmiterm([1 1 1 X], A7, 1, 's')      
lmiterm([1 1 1 Y8], -B7, 1, 's')

% LMI condition 8
lmiterm([1 1 1 X], A8, 1, 's')      
lmiterm([1 1 1 Y1], -B8, 1, 's')    
lmiterm([1 1 1 X], A8, 1, 's')      
lmiterm([1 1 1 Y2], -B8, 1, 's')    
lmiterm([1 1 1 X], A8, 1, 's')      
lmiterm([1 1 1 Y3], -B8, 1, 's')   
lmiterm([1 1 1 X], A8, 1, 's')      
lmiterm([1 1 1 Y4], -B8, 1, 's')   
lmiterm([1 1 1 X], A8, 1, 's')      
lmiterm([1 1 1 Y5], -B8, 1, 's')   
lmiterm([1 1 1 X], A8, 1, 's')      
lmiterm([1 1 1 Y6], -B8, 1, 's')   
lmiterm([1 1 1 X], A8, 1, 's')      
lmiterm([1 1 1 Y7], -B8, 1, 's')   
lmiterm([1 1 1 X], A8, 1, 's')      
lmiterm([1 1 1 Y8], -B8, 1, 's')

% LMI condition 9
lmiterm([-5 1 1 X], 1, 1)   % specify right side

lmi_sys = getlmis;

[tmin, xfeas] = feasp(lmi_sys);

if tmin < 0
    Xs = dec2mat(lmi_sys, xfeas, X);
    Ys1 = dec2mat(lmi_sys, xfeas, Y1);
    Ys2 = dec2mat(lmi_sys, xfeas, Y2);
    Ys3 = dec2mat(lmi_sys, xfeas, Y3);
    Ys4 = dec2mat(lmi_sys, xfeas, Y4);
    Ys5 = dec2mat(lmi_sys, xfeas, Y5);
    Ys6 = dec2mat(lmi_sys, xfeas, Y6);
    Ys7 = dec2mat(lmi_sys, xfeas, Y7);
    Ys8 = dec2mat(lmi_sys, xfeas, Y8);
end

F1 = Ys1 * inv(Xs);
F2 = Ys2 * inv(Xs);
F3 = Ys3 * inv(Xs);
F4 = Ys4 * inv(Xs);
F5 = Ys5 * inv(Xs);
F6 = Ys6 * inv(Xs);
F7 = Ys7 * inv(Xs);
F8 = Ys8 * inv(Xs);
P = inv(Xs);

%% Fuzzy controller in MATLAB code
Initial_value = [0 0 0 0 0 0]';
dt = 0.01;
input = [0 0 0 0 0 0 0 0]';

t = 0:dt:10;
Xsaved = zeros(6,1001);
for i=1:size(t,2)
    if i==1
        % Controller
        x = Initial_value;
        Xsaved(:,i) = x;
        e = x - input;
        h1 = (Phi_dot_max-Xsaved(4,i))*(Theta_dot_max-Xsaved(5,i))*(Psi_dot_max-Xsaved(6,i))/(den1*den2*den3);
        h2 = (Phi_dot_max-Xsaved(4,i))*(Theta_dot_max-Xsaved(5,i))*(Psi_dot_min+Xsaved(6,i))/(den1*den2*den3); % 수정할 것
        h3 = (Phi_dot_max-Xsaved(4,i))*(Theta_dot_max-Xsaved(5,i))*(Psi_dot_max-Xsaved(6,i))/(den1*den2*den3); % 수정할 것
        h4 = ()*()*()/(den1*den2*den3);
        h5 = ()*()*()/(den1*den2*den3);
        h6 = ()*()*()/(den1*den2*den3);
        h7 = ()*()*()/(den1*den2*den3);
        h8 = ()*()*()/(den1*den2*den3);
        
    else

    end
    
end

figure(1)
plot(t,Xsaved(1,:))
hold on
plot(t,Xsaved(2,:))
plot(t,Xsaved(3,:))
hold off