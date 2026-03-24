# SCARA-Kinematics-Analysis
This repository features a kinematic analysis of a 3-DOF SCARA robot. It includes DH parameter derivation, forward and inverse kinematics solvers in MATLAB, and trajectory tracking simulations in Simulink. The project demonstrates a complete workflow from mathematical modeling to following a square trajectory in a 3D workspace.

PROJECT OVERVIEW
----------------

1. MATHEMATICAL MODELING
------------------------
The robot is modeled using the Denavit-Hartenberg (DH) convention 
for a 3-revolute (RRR) joint configuration.

<img width="1143" height="417" alt="image" src="https://github.com/user-attachments/assets/5a060910-cd13-48c2-9718-7fc774626aff" />

Forward Kinematics Equations:
X = 0.4*cos(q1) + 0.3*cos(q1+q2) + 0.15*cos(q1+q2+q3)
Y = 0.4*sin(q1) + 0.3*sin(q1+q2) + 0.15*sin(q1+q2+q3)
Z = 0.60 m (Constant height for all joint configurations)

2. INVERSE KINEMATICS
---------------------
The inverse kinematics problem is solved numerically using 
MATLAB's 'vpasolve' function to determine joint angles for 
target Cartesian coordinates.

Verification Case:
Target: X=0.7719, Y=0.3023, Z=0.60
Result: theta_1=10 deg, theta_2=15 deg, theta_3=20 deg

3. TRAJECTORY SIMULATION
------------------------
The system tracks a square trajectory in the Z=0.6 plane 
traversing four primary waypoints:
- P1 (0.32, 0.32)
- P2 (0.08, 0.32)
- P3 (0.08, 0.08)
- P4 (0.32, 0.08)

  ![robotgif](https://github.com/user-attachments/assets/2c9ca12d-37fd-41a4-a51f-8f17339e3217)

4. FILE STRUCTURE
-----------------
- HW3_FK.m: Symbolic derivation of position equations.
- IK_targetpos.m: Numerical IK solver script.
- IK_System.slx: Simulink model for trajectory tracking.
- square_trajectory.mat: Workspace data for the simulation.
- HW_SCARA_Report.pdf: Detailed technical documentation.

5. HOW TO RUN
-------------
1. Add all files to the MATLAB path.
2. Run 'HW3_FK.m' to view the symbolic transformation matrices.
3. Open 'IK_System.slx' and run the simulation to observe the 
   robot following the square path.

------------------------------------------------------------
Developed for RAS 545
============================================================
