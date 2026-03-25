
# SCARA Kinematics Analysis 🤖

## 📌 Overview
This project analyzes the forward and inverse kinematics of a SCARA (Selective Compliance Assembly Robot Arm) using MATLAB and Simulink.

The system models the relationship between joint variables and the end-effector position, and validates the results through simulation.

---

## ⚙️ System Description

The SCARA robot consists of three rotational joints with fixed vertical displacement. The kinematic model is defined using Denavit–Hartenberg (DH) parameters.

### DH Parameters:
| Joint | θ (angle) | d (offset) | a (length) | α (twist) |
|------|----------|-----------|-----------|-----------|
| 1 | θ₁ | 0.2 m | 0.4 m | 0 |
| 2 | θ₂ | 0.25 m | 0.3 m | 0 |
| 3 | θ₃ | 0.15 m | 0.15 m | 0 |

---

## 🧮 Forward Kinematics

The end-effector position is computed using homogeneous transformation matrices:

T = A₁ · A₂ · A₃

### Position Equations:
- X = 0.4 cos(θ₁) + 0.3 cos(θ₁ + θ₂) + 0.15 cos(θ₁ + θ₂ + θ₃)
- Y = 0.4 sin(θ₁) + 0.3 sin(θ₁ + θ₂) + 0.15 sin(θ₁ + θ₂ + θ₃)
- Z = 0.6 m (constant)

📌 The Z position remains constant due to the robot's structure.

---

## ✅ Validation

The forward kinematics equations were validated using MATLAB:

- For θ₁ = 0°, θ₂ = 0°, θ₃ = 0°:
  - X = 0.85 m
  - Y = 0 m
  - Z = 0.6 m

- For θ₁ = 10°, θ₂ = 15°, θ₃ = 20°:
  - X ≈ 0.7719 m
  - Y ≈ 0.3023 m
  - Z = 0.6 m

Results were verified using MATLAB scripts.

---

## 🧠 Workspace Analysis

The robot workspace is a **planar annulus** located at:

Z = 0.6 m

- Maximum reach: 0.85 m

This represents the reachable region of the end-effector in Cartesian space.

---

## 🖥️ Simulation (Simulink)

A Simscape Multibody model was built in Simulink to simulate the SCARA robot.

Features:
- Joint inputs (θ₁, θ₂, θ₃)
- Forward kinematics block
- Scope visualization of X, Y, Z

The simulation confirms analytical results.

---

## 🔄 Inverse Kinematics

Inverse kinematics was implemented to compute joint angles for a desired end-effector position.

### Example Target:
(X, Y, Z) = (0.7719, 0.3023, 0.6)

The corresponding joint angles were solved using MATLAB.

---

## 📐 Trajectory Planning

The robot follows a square trajectory in Cartesian space:

- P₁ = (0.32, 0.32, 0.60)
- P₂ = (0.08, 0.32, 0.60)
- P₃ = (0.08, 0.08, 0.60)
- P₄ = (0.32, 0.08, 0.60)

The inverse kinematics controller drives the end-effector through these points.

---

## 🎥 Demo

  ![robotgif](https://github.com/user-attachments/assets/2c9ca12d-37fd-41a4-a51f-8f17339e3217)

The robot successfully follows a square path using inverse kinematics control.

---

## 🛠️ Tech Stack
- MATLAB
- Simulink (Simscape Multibody)
- Robotics Kinematics
- Linear Algebra

---

## 📚 Key Concepts
- Denavit–Hartenberg (DH) modeling
- Homogeneous transformations
- Forward & inverse kinematics
- Workspace analysis
- Trajectory planning

---

## ▶️ How to Run

1. Clone the Repository
```bash
git clone https://github.com/Niki-89-AI/SCARA-Kinematics-Analysis.git
cd SCARA-Kinematics-Analysis

2. Open MATLAB
Launch MATLAB
Set the current folder to the project directory
Ensure all .m and .slx files are in the same workspace

3. Run Forward Kinematics
HW3_FK.m

4. Run Inverse Kinematics
IK_targetpos.m

5. Run Simulink Model
Open the Simulink file (SCARA_model.slx)


🔗 Author
Nikoletta Biri
Arizona State University – AI (Robotics)
