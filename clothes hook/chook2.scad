
//include <ruler.scad>;

// modifiers % transparent # debug * disable ! ignore the rest
$fn=32;
vth=3;
hth=5;
make();
ruler(r=[0,0,0],t=[0,-10,0]);
space=24;
rollr=vth*1.2;
width=15;

module make(){
	//roundedBox([10,20,10], 1,true);
   //body

   cube([width,40,vth]);
   translate([0,-hth,0]) cube([width,hth,space+vth*2]);
   translate([0,0,space+vth]) cube([width,40,vth]);
   translate([0,22,vth]) cube([width,6,2]);


   //bottom ribs
   difference(){
	   translate([0,-hth,-vth]) cube([3,40+hth,vth]);
   	translate([hth,-0.5-hth,-vth]) rotate([270,0,0])cylinder(r=vth*1.2,h=40+1+hth);
	}
   difference(){
	   translate([width-vth,-hth,-vth]) cube([3,40+hth,vth]);
 		translate([width-vth-rollr/2-0.2,-0.5-hth,-vth])rotate([270,0,0])cylinder(r=vth*1.2,h=40+1+hth);
   }

   
   //top ribs
   difference(){
	   translate([0,-hth,vth*2+space]) cube([3,40+hth,vth]);
   	translate([hth,-0.5-hth,space+rollr+vth*1.8]) rotate([270,0,0])cylinder(r=vth*1.2,h=40+1+hth);
	}
   difference(){
	   translate([width-vth,-hth,vth*2+space]) cube([3,40+hth,vth]);
 		translate([width-vth-rollr/2-0.2,-0.5-hth,space+rollr+vth*1.8])rotate([270,0,0])cylinder(r=vth*1.2,h=40+1+hth);
   }

   
//hook
  hr=7;
  hrz=10;
  hin=-5.5;
  puckr=2;
  difference(){
	  translate([0,hin,hrz]) rotate([0,90,0]) cylinder(r=hr,h=width);
	  translate([-0.5,hin,hrz+4]) rotate([0,90,0]) cylinder(r=hr,h=width+1);
	  translate([-0.5+width/2,0,vth+(hr*2+2)/2+0.1]) cube([width+2,hth,hr*2+2],center=true); 
	}
  translate([0,hin-8+puckr/2,hrz+2]) rotate([0,90,0]) cylinder(r=puckr,h=width);
};
