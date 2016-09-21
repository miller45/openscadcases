include <shapes.scad>
include <../openscad-bitmap/bitmap.scad>

kerf = 0.4;

D = 14 + kerf; 	// DIAMETER OF NUT
M = D/2; 	// MARGIN
H = 5; 	// HEIGHT (THICKNESS) OF TOOL
Ltot = D * 10; 	// TOTAL LENGTH OF TOOL


// Length from Center of One Side to Center of Other Side
L = Ltot-2*(D/2+M);

module num_to_str(number, block_size, height) {
	numbers_size = ceil(log(number + 1) / log(10));
	for (loc = [0:numbers_size - 1]) {
		translate([0, (numbers_size - loc - 1) * block_size * 8, 0]) {
			if (floor(number / pow(10, loc)) % 10 == 0)
				8bit_char("0", block_size, height);
			if (floor(number / pow(10, loc)) % 10 == 1)
				8bit_char("1", block_size, height);
			if (floor(number / pow(10, loc)) % 10 == 2)
				8bit_char("2", block_size, height);
			if (floor(number / pow(10, loc)) % 10 == 3)
				8bit_char("3", block_size, height);
			if (floor(number / pow(10, loc)) % 10 == 4)
				8bit_char("4", block_size, height);
			if (floor(number / pow(10, loc)) % 10 == 5)
				8bit_char("5", block_size, height);
			if (floor(number / pow(10, loc)) % 10 == 6)
				8bit_char("6", block_size, height);
			if (floor(number / pow(10, loc)) % 10 == 7)
				8bit_char("7", block_size, height);
			if (floor(number / pow(10, loc)) % 10 == 8)
				8bit_char("8", block_size, height);
			if (floor(number / pow(10, loc)) % 10 == 9)
				8bit_char("9", block_size, height);
		}
	}
}

rotate([0, 0, -45])
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
	translate([0,-L/2 - D / 4,H/2 - 0.5]) {
		rotate([0,0,30]) {
			hexagon(D, H + 2);
		}	
	}
	translate([0,-L/2 - D - D / 4,H/2 - 0.5]) {
		cube([D,2*D,H + 2], center = true);
	}
	translate([0,L/2,H/2 - 0.5]) {
		rotate([0,0,30]) {
			hexagon(D, H + 2);
		}	
	}
	translate([0, 0, H - 1])
		num_to_str(D, 1, 1.1);
}
