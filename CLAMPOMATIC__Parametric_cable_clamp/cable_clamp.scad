//*** Parametric cable clamp ***
//Bertrand Achard - December 21st 2012 - Creative Common attribution share alike.

//You can use two of them screwed together, or use one attached to the frame.
//The design assumes that the diameter of the screws is smaller than the cable.

//Diameter of the cable
cable_diam=8;
//Diameter of the 2 screws
screw_diam=3;
//How much you want the cable to be "pressed"
cable_press=cable_diam*0.1;

//The height of the cube (z axis)
cube_z=cable_diam*1.5;
//The depth of the cube (x axis), min=screw_diam+some margin
cube_x=screw_diam*4;
//The width of the cube (y axis), min=6
cube_y=cable_diam*6;

difference()
{
	cube([cube_x/2,cube_y/2,cube_z/2], true);

	translate([0,0,cube_z/4+cable_press])
		rotate([0,90,0])
			cylinder(h=cube_x, r1=cable_diam/2, r2=cable_diam/2, center=true, $fn=screw_diam*15);


	translate([0,-cube_y/8-cable_diam/4,0])
		rotate([0,0,90])
			cylinder(h=cube_z, r1=screw_diam/2, r2=screw_diam/2, center=true, $fn=screw_diam*15);

	translate([0,cube_y/8+cable_diam/4,0])
		rotate([0,0,90])
			cylinder(h=cube_z, r1=screw_diam/2, r2=screw_diam/2, center=true, $fn=screw_diam*15);
}
