$fn=64;

ocr=25;
bedh=12;
both=2;
toth=2;
snib=0.01;

difference(){
	translate([0,0,ocr/2-bedh/2+both]) makebed();
	rotate([0,90,0])    scale(1.02) makedrill();   
  translate([20,0,ocr/2-bedh/2+both+toth]) makebedhollow(36,26,10);
}
	
//donut(xr,[0,90,0]);

module makebed(){
  cube([80,30,bedh],center=true);
}
module makebedhollow(l,w,c){  
  translate([0,c,0])cube([l,w/2-c/2,bedh],center=true);
  translate([0,-c,0])cube([l,w/2-c/2,bedh],center=true);
}
module makedrill(){
   union(){
	   translate([0,0,-75])cylinder(r=15/2,h=40+snib);
   	translate([0,0,-35])cylinder(r1=15/2,r2=ocr/2,h=15+snib);
	   translate([0,0,-20])cylinder(r=ocr/2,h=20+snib);
	   translate([0,0,0])cylinder(r1=ocr/2,r2=13/2,h=1+snib);
   	translate([0,0,0])cylinder(r=13/2,h=10+snib);
	   translate([0,0,10])cylinder(r1=13/2,r2=10/2,h=1+snib);
		translate([0,0,10])cylinder(r=10/2,h=30+snib*2);
	}	
}

module test(){
	rotate_extrude(convexity=10,$fn=smooth)
		translate([cr-ct-r,ct+r,0])
			circle(r=r,$fn=smooth);
}

module donut(r,rot=[0,0,0]){

pad = 0.1;	// Padding to maintain manifold
ch = 15;
cr = 20;
ct = 2;
xr = 4;
smooth = 180;	// Number of facets of rounding cylinder

   rotate(rot)
		rotate_extrude(convexity=10,$fn=smooth)
			translate([cr-ct-r,ct+r,0])
				circle(r=r,$fn=smooth);
}