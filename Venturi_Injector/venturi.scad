od = 21.29;
od_rad = od/2;
od_min = 15;
od_min_rad = 15/2;

output_cyl_ht = 55;
wall_thick = 2;
input_cyl_ht = 24;


module output() {
	difference() {
		cylinder(r2=od_rad, r1=od_min_rad, h=output_cyl_ht, center=true);
		cylinder(r2=od_rad-wall_thick, r1=7/2, h=output_cyl_ht+1, center=true);
	}
}

module input() {
	difference() {
		cylinder(r1=od_rad, r2=od_min_rad, h=input_cyl_ht, center=true);
		cylinder(r1=od_rad-wall_thick, r2=7/2, h=input_cyl_ht+1, center=true);
	}
}

module glued() {
	difference() {
		cylinder(r=od_rad, h=20, center=true);
		cylinder(r=od_rad-wall_thick, h=27, center=true);
	}
}

module nipple() {
	difference() {
		cylinder(r=9/2, h=26, center=true);
		cylinder(r=9/2-wall_thick, h=28, center=true);
	}
}

union() {
translate([0,0,-22]) glued();
input();
difference() {
	union() {
		translate([0,0,output_cyl_ht/2+12]) output();
		translate([15,0,17]) rotate([0,90,0]) cylinder(r=9/2, h=16, center=true);
	}
	translate([15,0,17]) rotate([0,90,0]) cylinder(r=9/2-wall_thick, h=30, center=true);
}
translate([0,0,77]) glued();
translate([16,0,-9.5]) cube(size=[14,2,45], center=true);
}