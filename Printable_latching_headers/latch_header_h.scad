wallthick = 3;
pins = 4;
bridge = false;

linear_extrude(height = wallthick, convexity = 2) difference() {
	square([pins * 2.54 + .5 + wallthick * 2, 11.5], center = true);
	#translate([0, 3, 0]) square([5.6, 2.5], center = true);
	#translate([0, 1, 0]) square([3.1, 6.5], center = true);
}

linear_extrude(height = wallthick + 1.6, convexity = 2) difference() {
	square([pins * 2.54 + .5 + wallthick * 2, 11.5], center = true);
	#translate([0, 4, 0]) square([5.6, 4.5], center = true);
	#translate([0, 2, 0]) square([3.1, 8.5], center = true);
}

linear_extrude(height = wallthick + 1.6 + 3, convexity = 2) difference() {
	square([pins * 2.54 + .5 + wallthick * 2, 11.5], center = true);
	#translate([0, 2, 0]) square([pins * 2.54 + .5, 11.5], center = true);
	#translate([0, -2, 0]) square([pins * 2.54, 11.5], center = true);
}

translate([0, 0, wallthick + 1.6 + 2]) difference() {
	linear_extrude(height = wallthick + .54, convexity = 2) difference() {
		square([pins * 2.54 + .5 + wallthick * 2, 11.5], center = true);
		#translate([0, 2, 0]) square([pins * 2.54 + .5, 11.5], center = true);
	}
	translate([0, -2, 0]) rotate([0, 45, 0]) cube([(pins * 2.54) / sqrt(2), 11.5, (pins * 2.54) / sqrt(2)], center = true);
}

translate([0, 0, wallthick + 1.6 + 2.54]) difference() {
	linear_extrude(height = wallthick, convexity = 2) difference() {
		square([pins * 2.54 + .5 + wallthick * 2, 11.5], center = true);
	}
	translate([0, 0, 0]) rotate([0, 45, 0]) cube([(pins * 2.54 + .5) / sqrt(2), 12, (pins * 2.54 + .5) / sqrt(2)], center = true);
	translate([0, -2, 0]) rotate([0, 45, 0]) cube([(pins * 2.54) / sqrt(2), 11.5, (pins * 2.54) / sqrt(2)], center = true);
}

if (bridge) translate([0, 0, wallthick + 1.6 + 3]) linear_extrude(height = wallthick, convexity = 2) square([pins * 2.54 + .5 + wallthick * 2, 11.5], center = true);
