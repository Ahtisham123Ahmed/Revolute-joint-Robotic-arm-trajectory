clc
clear all
theta1=0;
Theta2=0;
theta3=0;
%define the arms of the cylindrical MP according
%to the parameters of DH
L(1)=Link([theta1 0 0 0 0],'standard');
L(2)=Link([Theta2 5 0 -pi/2 0],'standard');
L(3)=Link([theta3 30 0 pi/2 0],'standard');
q_lim=[-pi pi;-pi pi;-pi pi];
q = [0 0 0];
MPc=SerialLink(L,'name','R_Robot','qlim',q_lim);



% Call the plot function with the corrected workspace limits
MPc.plot(q,'tilesize', 10);

theta1=linspace(-pi,pi,4);
theta2=linspace(-pi,pi,4);
theta3=linspace(-pi,pi,4);


q1=[theta1(1) theta2(1) theta3(1)];
q2=[theta1(2) theta2(2) theta3(2)];
q3=[theta1(3) theta2(3) theta3(3)];
q4=[theta1(4) theta2(4) theta3(4)];

jtraj1 = jtraj(q1,q2,50)
q_f1 = MPc.fkine(jtraj1);
x_traj = zeros(1,50);
y_traj = zeros(1,50);
z_traj = zeros(1,50);
for i=1:50
x_traj(1,i) = q_f1(1,i).t(1);
y_traj(1,i) = q_f1(1,i).t(2);
z_traj(1,i) = q_f1(1,i).t(3);
end
hold on
scatter3(x_traj,y_traj,z_traj,'.');
jtraj2 = jtraj(q2,q3,50);
q_f2 = MPc.fkine(jtraj2);
x_traj = zeros(1,50);
y_traj = zeros(1,50);
z_traj = zeros(1,50);
for i=1:50
x_traj(1,i) = q_f2(1,i).t(1);
y_traj(1,i) = q_f2(1,i).t(2);
z_traj(1,i) = q_f2(1,i).t(3);
end
hold on
scatter3(x_traj,y_traj,z_traj,'.');

jtraj3 = jtraj(q3,q4,50);
q_f3 = MPc.fkine(jtraj3);
x_traj = zeros(1,50);
y_traj = zeros(1,50);
z_traj = zeros(1,50);
for i=1:50
x_traj(1,i) = q_f3(1,i).t(1);
y_traj(1,i) = q_f3(1,i).t(2);
z_traj(1,i) = q_f3(1,i).t(3);
end
hold on
scatter3(x_traj,y_traj,z_traj,'.');

jtraj4 = jtraj(q4,q1,50);
q_f4 = MPc.fkine(jtraj4);
x_traj = zeros(1,50);
y_traj = zeros(1,50);
z_traj = zeros(1,50);
for i=1:50
x_traj(1,i) = q_f4(1,i).t(1);
y_traj(1,i) = q_f4(1,i).t(2);
z_traj(1,i) = q_f4(1,i).t(3);
end
hold on
scatter3(x_traj,y_traj,z_traj,'.');
vstup = 0;
title('Robotic Arm simulation');
while (vstup ~= 1)
MPc.plot(jtraj1)
MPc.plot(jtraj2)
MPc.plot(jtraj3)
MPc.plot(jtraj4)
end
