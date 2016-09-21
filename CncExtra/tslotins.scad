width=12;
height=5;
length=20;
sd=3.3;
sr=sd/2;
$fn=64;
module make(){

   difference(){
        union(){
            cube([width,length,height]);       
        }
        translate([width/2,length/2,-0.1]) rotate([0,0,0]) cylinder(r=sr,h=height*1.2);
    }
}

make();
//inset(d=0.3) shape();

// outset(d=0.3) shape();

// rounding(r=0.3) shape();

//fillet(r=0.3) shape();

// shell(d=0.3) shape();

// shell(d=-0.3) shape();

// shell(d=0.3,center=true) shape();

module cutcyla(r,h,cutr=[0,0,0]){
   rotate(cutr) render() difference(){
		cylinder(r=r,h=h);
   	    translate([0,r/2+0.1,h/2]) cube([r*2,r+0.2,h],center=true);
	}
}

module cutcyl(r,h,cutofs,cutr=[0,0,0]){
   rotate(cutr) render() difference(){
			cylinder(r=r,h=h);
   	        translate([0,r/2-cutofs/2,h/2]) cube([r*2,r+cutofs*2,h],center=true);
	}
}
