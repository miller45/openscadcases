inch=25.4;
th=0.200*inch;
tb=0.222*inch; //dim b

tl=0.51*inch;
bih=3.76; //back inner height
bib=2.146;
bil=tl-4.33;
cons=2;
oix=bib;
gib=0.435; // inner gap 
echo ("tb ",tb);
echo ("th ",th);
echo ("tl ",tl);
echo ("e ",0.473/sqrt(2));
phei=3.61/2;
make();

module make(){   
  difference(){
   cube([tb,tl,th],center=true);

  union(){
		translate([-oix/2-gib/2,-bil/2,0]) cube([bib,bil,bih],center=true);
   	translate([-oix/2-gib/2,-6.607/2+0.11,bih/2+0.179/2-0.01]) cube([1.078,6.607,0.179],center=true);
   	translate([-oix/2-gib/2,-6.607/2+0.11,-bih/2-0.179/2+0.01]) cube([1.078,6.607,0.179],center=true);
	};

#   union(){
	   translate([+oix/2+gib/2,til,0]) cube([bib,bil,bih],center=true);
		translate([+oix/2+gib/2,-6.607/2+0.11,bih/2+0.179/2-0.01]) cube([1.078,6.607,0.179],center=true);
   	translate([+oix/2+gib/2,-6.607/2+0.11,-bih/2-0.179/2+0.01]) cube([1.078,6.607,0.179],center=true);
	};

union(){
  		translate([-oix/2-gib/2,bil/2+1.226*2.2,+phei-0.334*2]) rotate([90,0,0]) linear_extrude(height = 0.892+0.334, scale = [0.6,0.6]) square([1.397,1.436],center=true);
  		translate([-oix/2-gib/2,bil/2-1.331+1.226*2.2,+phei-0.334*2]) cube([0.891,0.334,0.896],center=true
);
	};

union(){
  		translate([+oix/2+gib/2,bil/2+1.226*2.2,+phei-0.334*2]) rotate([90,0,0]) linear_extrude(height = 0.892+0.334, scale = [0.6,0.6]) square([1.397,1.436],center=true);
  		translate([+oix/2+gib/2,bil/2-1.331+1.226*2.2,+phei-0.334*2]) cube([0.891,0.334,0.896],center=true
);
	};
   translate([-oix/2-gib/2,bil/2-1.21,-0.9]) cube([bib,5,2.116],center=true);
   translate([+oix/2+gib/2,bil/2-1.21,-0.9]) cube([bib,5,2.116],center=true);

  }//diff

	//translate([+oix/2+gib/2,bil/2-2.116,1]) cube([bib,2,2.116],center=true);
}