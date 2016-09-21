$fn=128;


//scale(1.29) import("Pin_Arm_Motor.stl",convexity=10);

h1=1.2; //org 2.58
r1=12/2; //org 5.16
h2org=20; //org 4.78
h2=h2org; 
r2=6.8/2; // org 2.58
pd=1.4;
hy=h1+h2org+pd/2+0.8;
r3=11.5/2;
r4=r3+2.5/2;
h3=h2;

bsc=0.5; //brackscale
teardropradius=1.8; //intention 1.5 dia
bfoh=60*bsc;//fullouterheight of bracket
adah=3.2;


union(){
    cylinder(r=r1,h=h1);
    translate([0,0,h1]) cylinder(r=r2,h=h2);
    shellhex(r4,r3,h1+h2);
    translate([0,0,-adah]) cylinder(r1=10,r2=r4,h=adah,$fn=20);
    translate([0,0,-adah]) scale(bsc) rotate([0,180,0]) bracket();
    
}






module shell(ro,ri,h){
    smi=0.05;
    render() difference(){
       cylinder(r=ro,h);
       translate([0,0,-smi/2]) cylinder(r=ri,h+smi);
    }
}

module shellhex(ro,ri,h){
 smi=0.05;
    render() difference(){
       cylinder(r=ro,h);
       translate([0,0,-smi/2]) cylinder(r=ri,h+smi,$fn=6);
    }
}


module teardrop(r, h) {
	union(){
		cylinder(h=h,r=r, center = true, $fn=20);
		intersection() {
			rotate(45,[0,0,1]) 
			cube([2*r, 2*r, h], center = true);
			
			translate([1.75*r, 0, 0]) 
			cube([2*r, 2*r, h], center = true);
		}
	}
}

module bracket() {
	difference() {
		difference() {
			cylinder(r=20, h=60, $fn=20);
	
			translate([0,0,45])
			cube([50,20,40], center=true);
	
			translate([25,0,45])
			cube([30,50,40], center=true);
	
			translate([-25,0,45])
			cube([30,50,40], center=true);

			translate([0,0,50])
			rotate(90, [1,0,0])
			rotate(90, [0,0,1])
			teardrop(r=teardropradius, h=60);
	
			translate([20,0,25])
			rotate(90, [1,0,0])
			cylinder(r=10, h=60, center=true);
	
			translate([-20,0,25])
			rotate(90, [1,0,0])
			cylinder(r=10, h=60, center=true);
		}

		translate([0,0,50])
		difference() {
			cube([60,60,50], center=true);

			rotate(90, [1,0,0])
			cylinder(r=10, h=60, center=true);	
			
			translate([0,0,-20])
			cube([60,60,40], center=true);
		}
	}
}
