# **Boom Lift Model with Simscape**

This example models a boom lift with hydraulic actuators. The lift 
has 6 hydraulic actuators in the chassis, 7 hydraulic actuators in 
the boom plus one other passive hydraulic cylinder. The mechanical model
of the lift was created in CAD software and imported into Simscape Multibody. 

* **CAD geometry** is imported to ensure accurate representation of masses, 
inertias, and joint locations.
* **Mechanical effects** are incorporated into the design, including ground 
contact, worm gear kinematics, cables, and flexible bodies
* **Actuator requirements** are refined using dynamic simulation with 
abstract actuator models
* **Hydraulic components** including valve blocks, pipelines, and actuators 
are integrated with the multibody model of the system.
* **Modular testing** ensures efficient development, as each actuation system
can be tested in a separate model
* **Integrated testing of physical system and controller** is supported by 
combining a hydromechanical model with sensors and a logic controller.
* **Interactive workflows** are shown using dashboard blocks to test algorithms
* **MATLAB Apps** helps you open the model that best matches your needs. 

Open the project file sm_boom_lift_crawler.prj to begin.

[![View Boom Lift Model in Simscape on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/84390-boom-lift-model-in-simscape)

## **Boom Lift Model with Hydraulics - Animation**
![](Overview/sm_boom_lift_crawler_mechExpAnim.png)

## **Boom Lift Model with Hydraulics - Model**
![](Overview/sm_boom_lift_crawler_model_hydraulic.png)

## **Boom Lift Model with Hydraulics - MATLAB App**
![](Overview/sm_boom_lift_crawler_MATLAB_App.png)

To learn more about modeling and simulation with Simscape, please visit:
* [Simscape Getting Started Resources](https://www.mathworks.com/solutions/physical-modeling/resources.html)
* Product Capabilities:
   * [Simscape&trade;](https://www.mathworks.com/products/simscape.html)
   * [Simscape Battery&trade;](https://www.mathworks.com/products/simscape-battery.html)
   * [Simscape Driveline&trade;](https://www.mathworks.com/products/simscape-driveline.html)
   * [Simscape Electrical&trade;](https://www.mathworks.com/products/simscape-electrical.html)
   * [Simscape Fluids&trade;](https://www.mathworks.com/products/simscape-fluids.html)
   * [Simscape Multibody&trade;](https://www.mathworks.com/products/simscape-multibody.html)

Copyright &copy; 2020-2025 The MathWorks, Inc.