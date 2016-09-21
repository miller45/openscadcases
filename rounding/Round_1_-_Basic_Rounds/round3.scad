pad = 0.1;	// Padding to maintain manifold
box_l = 10;	// Length
box_w = 10;	// Width
box_h = 10;	// Height
round_r = 2;	// Radius of round
smooth = 45;	// Number of facets of rounding cylinder

difference() {
	cube([box_l, box_w, box_h], center = true);
	translate([0, -box_w/2+round_r, box_h/2-round_r]) {
		difference() {
			translate([0,-round_r+pad,round_r+pad])
				cube([box_l+2*pad, round_r*2+pad, round_r*2+pad], center = true);
			rotate(a=[0,90,0])
				cylinder(box_l+4*pad,round_r,round_r,center=true,$fn=smooth);
		}
	}
}
