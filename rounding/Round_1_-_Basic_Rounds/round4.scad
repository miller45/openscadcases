pad = 0.1;	// Padding to maintain manifold
box_l = 10;	// Length
box_w = 10;	// Width
box_h = 10;	// Height
round_r = 2;	// Radius of round
smooth = 45;	// Number of facets of rounding cylinder

// Rounding all of the edges with cylinders
difference() {
	cube([box_l, box_w, box_h], center = true);

	translate([0, -box_w/2+round_r, box_h/2-round_r]) {
		difference() {
			translate([0,-round_r-pad,round_r+pad])
				cube([box_l+2*pad, round_r*2+pad, round_r*2+pad], center = true);
			rotate(a=[0,90,0])
				cylinder(box_l+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}
	translate([0, box_w/2-round_r, box_h/2-round_r]) {
		difference() {
			translate([0,round_r+pad,round_r+pad])
				cube([box_l+2*pad, round_r*2+pad, round_r*2+pad], center = true);
			rotate(a=[0,90,0])
				cylinder(box_l+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}
	translate([0, -box_w/2+round_r, -box_h/2+round_r]) {
		difference() {
			translate([0,-round_r-pad,-round_r-pad])
				cube([box_l+2*pad, round_r*2+pad, round_r*2+pad], center = true);
			rotate(a=[0,90,0])
				cylinder(box_l+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}
	translate([0, box_w/2-round_r, -box_h/2+round_r]) {
		difference() {
			translate([0,round_r+pad,-round_r-pad])
				cube([box_l+2*pad, round_r*2+pad, round_r*2+pad], center = true);
			rotate(a=[0,90,0])
				cylinder(box_l+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}

// ----

	translate([-box_l/2+round_r, box_w/2-round_r, 0]) {
		difference() {
			translate([-round_r-pad,round_r+pad,0])
				cube([round_r*2+pad, round_r*2+pad, box_h+2*pad], center = true);
			cylinder(box_h+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}
	translate([box_l/2-round_r, box_w/2-round_r, 0]) {
		difference() {
			translate([round_r+pad,round_r+pad,0])
				cube([round_r*2+pad, round_r*2+pad, box_h+2*pad], center = true);
			cylinder(box_h+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}

	translate([-box_l/2+round_r, -box_w/2+round_r, 0]) {
		difference() {
			translate([-round_r-pad,-round_r-pad,0])
				cube([round_r*2+pad, round_r*2+pad, box_h+2*pad], center = true);
			cylinder(box_h+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}
	translate([box_l/2-round_r, -box_w/2+round_r, 0]) {
		difference() {
			translate([round_r+pad,-round_r-pad,0])
				cube([round_r*2+pad, round_r*2+pad, box_h+2*pad], center = true);
			cylinder(box_h+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}

// ----

	translate([-box_l/2+round_r, 0, box_h/2-round_r]) {
		difference() {
			translate([-round_r-pad, 0, round_r+pad])
				cube([round_r*2+pad, box_w+2*pad, round_r*2+pad], center = true);
			rotate(a=[0,90,90])
				cylinder(box_w+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}
	translate([box_l/2-round_r, 0, box_h/2-round_r]) {
		difference() {
			translate([round_r+pad, 0, round_r+pad])
				cube([round_r*2+pad, box_w+2*pad, round_r*2+pad], center = true);
			rotate(a=[0,90,90])
				cylinder(box_w+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}
	translate([-box_l/2+round_r, 0, -box_h/2+round_r]) {
		difference() {
			translate([-round_r-pad, 0, -round_r-pad])
				cube([round_r*2+pad, box_w+2*pad, round_r*2+pad], center = true);
			rotate(a=[0,90,90])
				cylinder(box_w+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}
	translate([box_l/2-round_r, 0, -box_h/2+round_r]) {
		difference() {
			translate([round_r+pad, 0, -round_r-pad])
				cube([round_r*2+pad, box_w+2*pad, round_r*2+pad], center = true);
			rotate(a=[0,90,90])
				cylinder(box_w+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}
}
