# blender_robot_navigation
The dynamics of a differential robot is implemented in blender for experiments in visual navigation

Requirements:
Blender version 2.65.0

1) Open sSensorApplication.blend in blender 2.65
2) Select the Main script right beside the "Templates" button
3) On MotionDynamicMovement.Traj([x1,y1,x2,y2,...,xn,yn],fr) type the desired trajectory, considering that the robot always starts at 0,0. The "fr" refers to the quantity of frames captured by motion step. Default is 1, meaning that each movement step that the robot makes, a frame will be captured. 0 means that not frame will be rendered.
4) Press Run Script to start calculating the robot's trajectory and frames rendering.
5) The pictured are sotred inside folder "Imagens" in the root directory. The path can be changed in the AuxRobot.py script
6) By default, the cameras are pointed to the floor, to make them face forward, it is necessary to manually change the orientation of the cameras

Thanks to 
Marcus Lima - University of Campinas/Brazil (mvpleng@fem.unicamp.br)
Vinicius Bastos - University of Campinas/Brazil (vbbastos@fem.unicamp.br)
Prof. Paulo Kurka - University of Campinas/Brazil




