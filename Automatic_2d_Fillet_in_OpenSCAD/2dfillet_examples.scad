//
// 2dfillet 
// GPLv2
// (c) 2014 TakeItAndRun
//
r_fillet=.2 ;
// number of facets of the fillet
fn_fillet=16;
// number of segments of the sphere(circle) used to expand shapes
fn_mink=16;
// thichness of shell created around shapes
dr=.005;
// When doing a minkowski() with an object of zero dimension no expanded shape / shell is contstracted at all. Therefore set the radius of the minkowski_shpere(circle) to a very small number.
r_mink_sphere_min=0.00001;

// exmple 1: two crossed bars
//fillet_display(r_fillet=2){shape1();shape2();} 	//(uncomment to display)

// example 2: fillet between two spheres (r_fillet greater than ca. 3 will create a buldge
//fillet_display(r_fillet=1.5){shape3();shape4();} 	//(uncomment to display)

// example 3: fillet between a sphere and a cresent moon (r_fillet greater than ca. 3 will create a buldge
//fillet_display(r_fillet=1){shape3();shape5();} 	//(uncomment to display)

// parameters for the Letters L,O,V,E
h=4;		// height of letter
w=3;		// width of letter
d=1;		// line width of letters
l=w+d/4;	//	spacing of letters
// example 4: "LOVE" on top a base with fillets //(uncomment to display)
//linear_extrude(4)
//love(r_fillet=.75*d);	//(uncomment to display)


// prameters for example serif_V()
t=.2;		// height of serif bar
s=.45;		// width of serif
hh=w+2*s;
// example 5: letter V with serifs
//trim()
serif_V();		//(uncomment to display)

// display two shapes and the fillet in different colors
// The shapes a rendered and translated a little in z-direction to avoid z-buffer fighting when displayed with F5
//
module fillet_display(r_fillet=r_fillet,fn_fillet=fn_fillet){
	fillet(r_fillet,fn_fillet){children(0);children(1);}
	translate([0,0,0.01])color("red")render()children(0);
	translate([0,0,0.01])color("green")render()children(1);
}

// fillet between two child shapes
module fillet(r_fillet=r_fillet,fn_fillet=fn_fillet){
	for(a=[0:fn_fillet-1]){
		hull(){
			strip(r_fillet,a/fn_fillet){children(0);children(1);}
			strip(r_fillet,(a+1)/fn_fillet){children(0);children(1);}
		}
	}
}

// intersecton of shells a fraction of angle along the fillet
module strip(r=r_fillet,a=0){
	inter_shell(r*(1-cos(a*90)),r*(1-sin(a*90))){children(0);children(1);}
}

// intersection of shells around the two child shapes
module inter_shell(r1=r_fillet,r2=0){
	intersection(){
	shell()expand(r=r1)children(0);
	shell()expand(r=r2)children(1);
	}
}

// create a shell around the child shape
module shell(r=dr){
	difference(){
		expand(r=r)children();
		children();
	}
}

// expand a child shape in all directions by r
module expand(r=1){
	minkowski(){
		children();
		mink_sphere_2d(r);
	}
}

// area(in 2d) to expand/grow a shape by r into all directions
// (set the number of faces of this sphere (fn_mink) very small to save computation time)
module mink_sphere_2d(r=1,fn_mink=fn_mink){
	circle((r==0)?r_mink_sphere_min:r,$fn=fn_mink);
}

// Sample shapes

module shape1(){
	square([10,2],true);
}

module shape2(){
	translate([0,0,0])
	rotate(-30)square([2,10],true);
}

module shape3(){
	circle(2,$fn=32);
}

module shape4(){
	translate([4,0])circle(2,$fn=32);
}

module shape5(){
	translate([4,0])
		rotate(40)
		difference(){
			circle(2,$fn=32);
			translate([0,2,0])
				circle(2,$fn=32);
		}
}


module love(r_fillet=r_fillet){
	fillet_display(r_fillet){letter_L();shape7();}
	fillet_display(r_fillet){translate(1*[l,0])letter_O();shape7();}
	fillet_display(r_fillet){translate(2*[l,0])letter_V();shape7();}
	fillet_display(r_fillet){translate(3*[l,0])letter_E();shape7();}
}

//base for "LOVE"
module shape7(){
	translate([-2,-2])square([4*l-d/4+4,2]);
}

module letter_L(){
	square([d,h]);
	square([w,d]);
}

module letter_O(){
	translate([w/2,h/2])
		scale([1,h/w])
			difference(){
				circle(w/2,$fn=32);
				circle(w/4,$fn=32);
			}
}

module letter_V(){
	polygon([[0,h],[d,h],[w/2+d/2,0],[w/2-d/2,0]]);
	polygon([[w-d,h],[w,h],[w/2+d/2,0],[w/2-d/2,0]]);
}

module letter_E(){
	square([d,h]);
	square([w,d]);
	translate([0,h-d])square([w,d]);
	translate([0,h/2-d/2])square([w-d/2,d]);
}


module serif_V(){
	fillet_display(r_fillet=s){letter_V();translate([d/2,h])square([d+2*s,t],true);}
	fillet_display(r_fillet=s){letter_V();translate([w-d/2,h])square([d+2*s,t],true);}
	fillet_display(r_fillet=s){letter_V();translate([w/2,0])square([d+2*s,t],true);}
}

module trim(){
	difference(){
		children();
		translate([w/2,-hh/2-t/2])square(hh,true);
		translate([w/2,h+hh/2+t/2])square(hh,true);
	}
}

