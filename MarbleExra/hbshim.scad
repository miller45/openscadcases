
include <ruler.scad>;

// modifiers % transparent # debug * disable ! ignore the rest
$fn=32;
vth=3;
hth=5;
make();
ruler(r=[0,0,0],t=[0,-10,0]);
space=12;
rollr=vth*1.2;
width=15;
inlen=10;
//halfcyl
  hr=7;
  hrz=10;
  hin=-5.5;
  puckr=width/2;
screwd=3.5;

module make(){
	
   //body
difference(){
   union(){
	   cube([width,inlen,vth]);
	   translate([0,-hth,0]) cube([width,hth,space+vth]);

		//halfcyl
  		translate([width/2,-puckr/2,0]) rotate([0,0,0]) cutcyl(r=puckr,h=space+vth);
   
	}
   translate([width/2,-puckr/2,-0.1]) rotate([0,0,0]) cylinder(r=screwd/2,h=space+vth+0.2);
}

};

module cutcyl(r,h,cutr){
   render() difference(){
		cylinder(r=r,h=h);
   	translate([0,r/2+0.1,h/2]) cube([r*2,r+0.2,h],center=true);
	}
}