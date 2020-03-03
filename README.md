# Vehicle-Localization-and-Tracking

1. To execute, go to Code/
2. For Constant Velocity Model, which takes position(x,y) from measurements and estimates position(x,y), velocity(in x-direction), run maincv.m with the file of the measurements and choose an estimation algorithm.
3. For Constant Acceleration Model, which takes position(x,y) from measurements and estimates position(x,y), velocity(in x-direction) and acceleration(in x-direction), run mainca.m with the file of the measurements and choose an estimation algorithm.
4. Sample input files generated from CommonRoad scenario can be found in Data/. 
  - measurement_751.txt : only 8 measurements with time_step=0.1s
  - measurement_772.txt: 68 measurements(x,y,v_x,a_x) with time_step=0.1s
  - measurement_with_noise.txt: randomly generated data: x,y,v_x and a_x with time_step=1s
5. State Estimation Algorithms:
  - Segment Minimization: Create object with model and call estimate with measurement. See code in main.m
  - Volume Minimization
  - Interval Estimation
6. **Requirements**: Make sure you have CORA and mosek in your path 
7. Plot:
  - Green: Upper bound
  - Red: Lower bound
  - Blue: True measurement
