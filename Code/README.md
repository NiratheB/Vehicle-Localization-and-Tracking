# Vehicle-Localization-and-Tracking Codes

1. **Requirements**: Make sure you have CORA and mosek in your path 
2. Add Code folder and subfolder to your path
3. Execute sample to test
4. Choose Model:
	- Constant Velocity Model: CVModel
	- Constant Acceleration Model: CAModel
	- Point-Mass Model: PMModel
5. Choose Estimator:
	- Segment Minimization:
		- F-radius: Frad
		- P-radius: Prad
		- Volume: Vol
	- H-Infinity Interval Observer: Hinf
6. Plot:
	- Red: Upper bound
  	- Blue: Lower bound
  	- Green: True measurement
