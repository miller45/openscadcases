
//include <ruler.scad>;
$fn=32;
vth=3;
hth=5;
union() make();
ruler(r=[0,0,0],t=[0,-10,0]);
space=24;
rollr=vth*1.2;

module make(){
	//roundedBox([10,20,10], 1,true);
   //body

   cube([20,40,vth]);
   translate([0,-hth+0.01,0]) cube([20,hth,space+vth*2]);
   translate([0,0,space+vth]) cube([20,40,vth]);
   translate([0,22,vth]) cube([20,6,2]);


   //bottom ribs
   difference(){
	   translate([0,-hth,-vth]) cube([3,40+hth,vth]);
   	translate([hth,-0.5-hth,-vth]) rotate([270,0,0])cylinder(r=vth*1.2,h=40+1+hth);
	}
   difference(){
	   translate([20-vth,-hth,-vth]) cube([3,40+hth,vth]);
 		translate([20-vth-rollr/2-0.2,-0.5-hth,-vth])rotate([270,0,0])cylinder(r=vth*1.2,h=40+1+hth);
   }

   
   //top ribs
   difference(){
	   translate([0,-hth,vth*2+space]) cube([3,40+hth,vth]);
   	translate([hth,-0.5-hth,space+rollr+vth*1.8]) rotate([270,0,0])cylinder(r=vth*1.2,h=40+1+hth);
	}
   difference(){
	   translate([20-vth,-hth,vth*2+space]) cube([3,40+hth,vth]);
 		translate([20-vth-rollr/2-0.2,-0.5-hth,space+rollr+vth*1.8])rotate([270,0,0])cylinder(r=vth*1.2,h=40+1+hth);
   }

   
//hook
  hr=7;
  hrz=10;
  hin=-5;
  difference(){
	  translate([0,hin,hrz]) rotate([0,90,0]) cylinder(r=hr,h=20);
	  translate([-0.5,hin,hrz+4]) rotate([0,90,0]) cylinder(r=hr,h=20+1);
	  translate([-0.5+11,0,vth+(hr*2+2)/2+0.1]) cube([22,hth,hr*2+2],center=true); 
	}

};
