include <lib\morphology.scad>;
// core vars
$fn=32;

t=25;
wt=0.5;
bt=0.8;
h=10-wt; 
b=60-wt;
brt=4;
toplid=false;

   boxm();

module boxm(){
   difference(){
    union(){
  		linear_extrude(height = h, center = true, , slices = 20) 
			 shell(d=wt) square([b,t],center=true);
	   translate([0,0,-h/2])
			cube([b,t,bt],center=true);
	 } 
   translate([-b/2-wt-0.1,0,0.1])
    rotate([90,0,90])
	    triangle1();
   }
}

module triangle1(){
 linear_extrude(height=wt+0.2,slices=20)
	polygon([[-t/2,-h/2],[-t/2,h/2],[0,h/2]]);
}

module triangle2(){
 linear_extrude(height=wt+0.2,slices=20)
	polygon([[t/2,-h/2],[t/2,h/2],[0,h/2]]);
}

