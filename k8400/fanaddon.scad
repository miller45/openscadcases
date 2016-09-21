include <..\lib\morphology.scad>;
sqw=32.9;
sqh=36.6;
fans=30;//25.2;
color("red")translate([-1,-1,0])cube([1,1,1]);
translate([3.228,-4.2675,21.48])rotate([0,180,0])import(file = "PeekFanv1-1.stl");

//sideflap
color("green")
union(){
	translate([-0.01,0,0])linear_extrude(height=5.151)shape1();
	translate([-0.01,0,5.15])linear_extrude(height=14.26)shape2();
}
//frame
color("brown"){
   render()difference(){
		translate([3.54,2,0])linear_extrude(height=5.151)outset(d=2,$fn=16)square([sqw,sqh]);
		translate([3.54+0.74,2+2.3,-0.1])linear_extrude(height=5.351)square([fans,fans]);
	}
}
// clips
csx=8.5;
csy=9.2;
clos=1;
oz=-0.01;
cyr=1.5;
cyxofs=2.7;
cyyofs=2.1;
color("orange"){
   difference(){
	  	translate([csx+1,csy,5.15+oz]) rotate([0,0,180]) linear_extrude(height=3,scale=[0.8,0.8]) outset(d=clos,$fn=24) square([csx-clos,csy-clos]);
   	translate([csx/2+cyr/2+cyxofs,csy/2+cyr/2+cyyofs,5.15+oz-0.1]) cylinder(r=cyr,h=3.2,$fn=64);
};
   difference(){
 		translate([fans-0.2,fans+0.1,5.15+oz]) rotate([0,0,0]) linear_extrude(height=3,scale=[0.8,0.8]) outset(d=clos,$fn=24) square([csx-clos,csy-clos]);
		translate([fans+(csx/2-cyxofs),fans+(csy/2-cyyofs*1.4),5.15+oz-0.1]) cylinder(r=cyr,h=3.2,$fn=64);
	}

}



module shape1() {
    polygon([[-3.5,21],[-4.76,32.1],[-4.76,41],[-4.76,57],[-10.61,57],[-10.61,61],
[-2,61],[0.47,60],[1.54,57.6],[1.54,41],[1.54,0],[0,0]]);
}

module shape2() {
    polygon([[-4.76,32.1],[-4.76,57],[-10.61,57],[-10.61,61],
[-2,61],[0.47,60],[1.54,57.6],[1.54,32.1]]);
}