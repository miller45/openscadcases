include <MCAD/regular_shapes.scad>

// DIAMETER OF NUT in mm
D = 6.08+1.1;
// MARGIN	
M = D/2; 	
// HEIGHT (THICKNESS) OF TOOL in mm
H = 5;
// TOTAL LENGTH OF TOOL in mm
Ltot = 75; 	

// Length from Center of One Side to Center of Other Side
L = Ltot-2*(D/2+M);

difference() {
	union() {
		translate([0,L/2,H/2]) {
			cylinder(r = (D/2+M), h = H,center = true);
		}
		translate([0,-L/2,H/2]) {
			cylinder(r = (D/2+M), h = H,center = true);
		}
		translate([-1*D/2,-L/2,0]) {
			cube([D,L,H], center=false);
		}
	}
	//open
	translate([0,-L/2-D*0.4,-0.5]) {
		rotate([0,0,30]) {
			linear_extrude(height=H+1)hexagon(D/2);
		}	
	}

	translate([0,-1*D-L/2-D*0.4,H/2-0.4]) {
		cube([D*0.87,D*2,H+1], center = true);
	}
	//holey
	translate([0,L/2,-0.5]) {
		rotate([0,0,30]) {
			linear_extrude(height=H+1)hexagon(D/2);
		}	
	}
}



function din934_hex_nut_dia(dia) = lookup(dia, [
[2,4.38],[3,6.08],[4,7.74],[5,8.63],[6,10.89],[8,14.2],[10,18.72],[12,20.0],[16,26.8],[20,33.0],[24,39.55],[30,50.85],[36,60.79]]);

