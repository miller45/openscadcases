//*** Parametric cable clamp ***
//Bertrand Achard - Creative Common attribution share alike.

//v1.0 (21/12/2012) : Initial release
//v1.1 (24/12/2012) : Adds full-clamp setup (see below)
//v1.2 (25/12/2012) : Added rounded corners (using minkowski)

//The design assumes that the diameter of the screws is smaller than the cable.

//Two possible setups :
//
//1) Half-clamp (you can join 2 together to hold the cable)
//Factor 1.1 = presses the cable by 10%
//cable_press=cable_diam*0.5*1.1;
//cube_z=cable_diam*1.5;
//
//2) Full-clamp (you can screw the clamp to a flat surface)
//Factor 0.1 = presses the cable by 10%
//cable_press=cable_diam*0.1;
//cube_z=cable_diam*2.5;

//Diameter of the cable
cable_diam=8;
//Diameter of the 2 screws
screw_diam=3;
//How much you want the cable to be "pressed" (shifts the cable hole on the Z axis)
cable_press=cable_diam*0*1;

//The height of the cube (z axis)
cube_z=cable_diam*2.5;
//The depth of the cube (x axis), min=screw_diam+some margin
cube_x=screw_diam*4;
//The width of the cube (y axis), min=6
cube_y=cable_diam*6;

//Do not set this to 0, or remove the minkowski.
//Setting this to 0 will remove the cylinder in the minkowski, disabling it, and
//the corrections used for the minkowski will introduce an error.
cube_roundness=cable_diam/4;

difference()
{
	//-0.5 in translate and -1 in cube Z corrects for the error added by minkowski with cylinder h=1.
	translate([0,0,-0.5]) minkowski()
	{
		cube([cube_x/2-cube_roundness,cube_y/2-cube_roundness,cube_z/2-1], true);
		cylinder(r=cube_roundness/2,h=1,$fn=50);
	}

	translate([0,0,cube_z/4-cable_diam/2+cable_press]) union() {
		translate([0,0,cable_diam/4]) cube([cube_x/2+1, cable_diam, cable_diam/2+0.1], true);
		rotate([0,90,0])
			cylinder(h=cube_x/2+1, r1=cable_diam/2, r2=cable_diam/2, center=true, $fn=screw_diam*15);
	}

	translate([0,-cube_y/8-cable_diam/4,0])
		rotate([0,0,90])
			cylinder(h=cube_z, r1=screw_diam/2, r2=screw_diam/2, center=true, $fn=screw_diam*15);

	translate([0,cube_y/8+cable_diam/4,0])
		rotate([0,0,90])
			cylinder(h=cube_z, r1=screw_diam/2, r2=screw_diam/2, center=true, $fn=screw_diam*15);
}
