wallthick = 3;
pins = 4;

linear_extrude(height = 1.5, convexity = 2) difference() {
	translate([0, 0.8, 0]) square([wallthick * 2 + 2.54 * pins + 0.5, wallthick * 2 + 3 + 1.6], center = true);
	square([2.54 * pins + 0.5, 3], center = true);
	translate([0, 0.8, 0]) square([6.5, 3 + 1.6], center = true);
	for(side = [1, -1]) translate([side * (pins / 2 * 2.54 - 2), -1, 0]) square([1.5, 3], center = true);
}

difference() {
	linear_extrude(height = 11.5, convexity = 2) difference() {
		translate([0, 0.8, 0]) square([wallthick * 2 + 2.54 * pins + 0.5, wallthick * 2 + 3 + 1.6], center = true);
		square([2.54 * pins + 0.5, 3], center = true);
		translate([0, 1 + wallthick / 2, 0]) square([3.1, 3 + 1.6 + wallthick], center = true);
		for(side = [1, -1]) translate([side * (pins / 2 * 2.54 - 2), -1, 0]) square([1.5, 3], center = true);
	}
	rotate([0, 45, 0]) cube([(1.5 + 2.5 + 5.6 / 2) * sqrt(2), 10 + wallthick * 2, (1.5 + 2.5 + 5.6 / 2) * sqrt(2)], center = true);
}

linear_extrude(height = 11.5, convexity = 2) difference() {
	translate([0, 0.8, 0]) square([wallthick * 2 + 2.54 * pins + 0.5, wallthick * 2 + 3 + 1.6], center = true);
	square([2.54 * pins + 0.5, 3], center = true);
	translate([0, 1 + wallthick / 2, 0]) square([5.6, 3 + 1.6 + wallthick], center = true);
	for(side = [1, -1]) translate([side * (pins / 2 * 2.54 - 2), -1, 0]) square([1.5, 3], center = true);
}

translate([0, 0, 8]) linear_extrude(height = 3.5, convexity = 2) difference() {
	translate([0, 0.8, 0]) square([wallthick * 2 + 2.54 * pins + 0.5, wallthick * 2 + 3 + 1.6], center = true);
	square([2.54 * pins + 0.5, 3], center = true);
	for(side = [1, -1]) translate([side * (pins / 2 * 2.54 - 2), -1, 0]) square([1.5, 3], center = true);
}

translate([0, 0, 11.5 - 2]) linear_extrude(height = 2, convexity = 2) difference() {
	translate([0, 0.8, 0]) square([wallthick * 2 + 2.54 * pins + 0.5, wallthick * 2 + 3 + 1.6], center = true);
	square([2.54 * pins, 2.54], center = true);
}

