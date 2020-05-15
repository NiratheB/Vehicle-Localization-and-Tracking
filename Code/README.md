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

7. Evaluations:
	- Go to the Evaluations/ folder
	- To use Interaction dataset, add the csv file to Evaluations/Data/ and run get_data from PrecomputedData/ folder
	- A sample precomputed data is generated from the csv file in Data
	- Precomputed data for estimator and model can be found in folder PrecomputedData/<estimator>/<model>/~.mat
	
	* Computation Time
		- run the timegraph.m file in the Computation Time folder
		- A sample timer is present on Computation Time/Data/<estimator>.mat file
	* Bound
		- Calculate the average bounds from each estimator and model on precomputed data with Bounds/bound.m
	* Rate of change of Bound:
		- See a plot of how bound changes with estimator and model using Bounds/changebound.m
	* Accuracy
		- See a box plot of RMSE(Root Mean Square Error) of the average estimation from true value with Accuracy/boxplot_all.m
