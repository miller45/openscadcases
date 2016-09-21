difference() {
	union() {
		cylinder(h=22,r=5.5, $fn=40);
		translate([0,0,25.5])
			cube([14.5,5,51], center=true);
		translate([0,0,22])
			sphere(r=5.5, $fn=40);
	}
	translate([-6,-1.5,0]) cube([12,3,50]);

	translate([-7.25,-1.5,0]) cube([14.5,3,23]);
	translate([-7.5,0,23]) rotate([0,90,0])
		cylinder(h=15,r=1.5,$fn=20);

	cylinder(h=22,r=4.5, $fn=40);
	translate([0,0,22]) sphere(r=4.5, $fn=40);

	translate([0,3,46]) rotate([90,0,0])
		cylinder(h=6,r=1.25,$fn=10);
}
