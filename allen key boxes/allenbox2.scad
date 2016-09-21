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

   union(){
  		linear_extrude(height = h, center = true, , slices = 20) 
			 shell(d=wt) square([b,t],center=true);
	   translate([0,0,-h/2])
			cube([b,t,bt],center=true);
	}

}



