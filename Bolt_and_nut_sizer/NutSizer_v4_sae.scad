include <libraries/MCAD/shapes.scad>
include <bitmap.scad>

kerf = 0.6;//0.7; // slack for nut, in mm. Nut must fit, but tight is good too.
// Text size
Tsz=1.25;

w=85;
ht=13;
spc=2.4;

D01 = 25.4*1./4. + kerf;   //#4 nut
x01 = 15;
y01 = D01/2+spc;
r01=(0.12*25.4)/2.0+kerf;

D02 = 25.4*5./16. + kerf;   //#6 nut
x02 = 15;
y02 = y01+D01+spc;
r02=(0.14*25.4)/2.0+kerf;

D03 = 25.4*11./32. + kerf;   //#8 nut
x03 = 15;
y03 = y02+D02+spc;
r03=(0.165*25.4)/2.0+kerf;

D04 = 25.4*6./16. + kerf;   //#10 nut
x04 = 15;
y04 = y03+D03+spc;
r04=(0.195*25.4)/2.0+kerf;

D05 = 25.4*7./16. + kerf;   //1/4 nut
x05 = 15;
y05 = y04+D04+spc;

D06 = 25.4*8./16. + kerf;   //5/16 nut
x06 = 15;
y06 = y05+D05+spc;

D07 = 25.4*9./16. + 1.25*kerf;   //3/8 nut
x07 = 15;
y07 = y06+D06+spc;

D08b = 25.4*10./16. + 1.5*kerf;  // 7/16" bolt head size
D08n = 25.4*11./16. + 1.5*kerf;  // 7/16" nut size
x08 = 15;
y08 = y07+D07+spc;

D09 = 25.4*3/4 + 1.5*kerf;  // 1/2" nut
x09 = 15;
y09 = y08+D08b+1.5*spc;

L = y09+D09/2+spc; // Comes out to 132 mm if spc=2.5 mm

yh0=y02-D02/2-spc/2;
yh1=y09-D09/2-spc/2;

// Do the deed
translate([0,0,ht])rotate([180,0,0]) // Uncomment this line to print upside down to get shiny surface
  nutSizer();


module nutSizer()
{
  // union()    // This gives raised  measurment tics
  difference()  // This gives lowered measurment tics
  {
   nutSizerBasic();

   // Measurement tics
   for(i=[1:5])
   {
     translate([0,i*25.4,ht-8])cube([6,1,12]);
   }
   for(i=[1:10])
   {
     translate([0,i*25.4/2,ht-6])cube([4,1,9]);
   }
   for(i=[1:20])
   {
     translate([0,i*25.4/4,ht-4])cube([3,1,6]);
   }
   for(i=[1:42])
   {
     translate([0,i*25.4/8,ht-2])cube([1,1,3]);
   }
  }
}

module nutSizerBasic()
{
  difference()
  {
    translate([0,0,0.001]) cube([w,L,ht+0.001]);

    // Nut indentions
    translate([x01,y01,3*ht/2-3]) hexagon(D01, ht);
    translate([w-x01,y01,3*ht/2-3]) hexagon(D01, ht);
    translate([w/2,y01,ht-3])rotate([0,0,90])num_to_str(4, Tsz,40.1);

    translate([x02,y02,3*ht/2-3]) hexagon(D02, ht);
    translate([w-x02,y02,3*ht/2-3]) hexagon(D02, ht);
    translate([w/2,y02,ht-3])rotate([0,0,90])num_to_str(6, Tsz,40.1);

    translate([x03,y03,3*ht/2-4]) hexagon(D03, ht);
    translate([w-x03,y03,3*ht/2-4]) hexagon(D03, ht);
    translate([w/2,y03,ht-3])rotate([0,0,90])num_to_str(8, Tsz,40.1);

    translate([x04,y04,3*ht/2-4]) hexagon(D04, ht);
    translate([w-x04,y04,3*ht/2-4]) hexagon(D04, ht);
    translate([w/2+4*Tsz,y04,ht-3])rotate([0,0,90])num_to_str(10, Tsz,40.1);

    translate([x05,y05,3*ht/2-5]) hexagon(D05, ht);
    translate([w-x05,y05,3*ht/2-5]) hexagon(D05, ht);
    translate([w/2+7*Tsz-2,y05-3,ht-3])rotate([0,0,90])8bit_char("1", Tsz,40.1);
    translate([w/2+0*Tsz-1  ,y05  ,ht-3])rotate([0,0,90])8bit_char("/", Tsz,40.1);
    translate([w/2-6*Tsz+2,y05+3,ht-3])rotate([0,0,90])8bit_char("4", Tsz,40.1);

    translate([x06,y06,3*ht/2-6]) hexagon(D06, ht);
    translate([w-x06,y06,3*ht/2-6]) hexagon(D06, ht);
    translate([w/2+10*Tsz-2 ,  y06-3,ht-3])rotate([0,0,90])8bit_char("5", Tsz,40.1);
    translate([w/2 +3*Tsz-1 ,  y06  ,ht-3])rotate([0,0,90])8bit_char("/", Tsz,40.1);
    translate([w/2 -2.5*Tsz ,  y06+3,ht-3])rotate([0,0,90])8bit_char("1", Tsz,40.1);
    translate([w/2 -9.0*Tsz ,  y06+3,ht-3])rotate([0,0,90])8bit_char("6", Tsz,40.1);

    translate([x07,y07,3*ht/2-7]) hexagon(D07, ht);
    translate([w-x07,y07,3*ht/2-8]) hexagon(D07, ht);
    translate([w/2+7*Tsz-2,y07-3,ht-3])rotate([0,0,90])8bit_char("3", Tsz,40.1);
    translate([w/2+0*Tsz  ,y07  ,ht-3])rotate([0,0,90])8bit_char("/", Tsz,40.1);
    translate([w/2-6*Tsz+2,y07+4,ht-3])rotate([0,0,90])8bit_char("8", Tsz,40.1);

    translate([x08,y08,3*ht/2-8]) hexagon(D08b, ht);
    translate([x08,y08,0.3])rotate([0,0,90])8bit_char("B", Tsz,40.1);
    translate([w-x08,y08,3*ht/2-10]) hexagon(D08n, ht);
    translate([w-x08,y08,0.3])rotate([0,0,90])8bit_char("N", Tsz,40.1);
    translate([w/2+10*Tsz  -2,y08-3,ht-3])rotate([0,0,90])8bit_char("7", Tsz,40.1);
    translate([w/2 +3*Tsz    ,y08,ht-3])rotate([0,0,90])8bit_char("/", Tsz,40.1);
    translate([w/2 -2.5*Tsz+2,y08+3 ,ht-3])rotate([0,0,90])8bit_char("1", Tsz,40.1);
    translate([w/2 -9.0*Tsz+2,y08+3,ht-3])rotate([0,0,90])8bit_char("6", Tsz,40.1);

    translate([x09,y09,3*ht/2-9]) hexagon(D09, ht);
    translate([w-x09,y09,3*ht/2-11]) hexagon(D09, ht);
    translate([w/2+7*Tsz-2,y09-4,ht-3])rotate([0,0,90])8bit_char("1", Tsz,40.1);
    translate([w/2+0*Tsz  ,y09  ,ht-3])rotate([0,0,90])8bit_char("/", Tsz,40.1);
    translate([w/2-6*Tsz+2,y09+4,ht-3])rotate([0,0,90])8bit_char("2", Tsz,40.1);

    // Bottom mounting holes for certain bolts 
    translate([x01,y01,0])cylinder(r=2.0*r01,h=3);
    translate([x01,y01,0])cylinder(r=r01,h=ht);
    translate([x02,y02,0])cylinder(r=2.0*r02,h=3);
    translate([x02,y02,0])cylinder(r=r02,h=ht);
    translate([x03,y03,0])cylinder(r=2.0*r03,h=4);
    translate([x03,y03,0])cylinder(r=r03,h=ht);
    translate([x04,y04,0])cylinder(r=2.0*r04,h=5);
    translate([x04,y04,0])cylinder(r=r04,h=ht);

    // Mounting holes
    translate([5,  9.5,-1])cylinder(r=2,h=ht+2);
    translate([w-5,9.5,-1])cylinder(r=2,h=ht+2);
    translate([5,  yh1,-1])cylinder(r=2,h=ht+2);
    translate([w-5,yh1,-1])cylinder(r=2,h=ht+2);

    // Countersink
    translate([5,  9.5,ht-2])cylinder(r1=2,r2=4,h=3);
    translate([w-5,9.5,ht-2])cylinder(r1=2,r2=4,h=3);
    translate([5,  yh1,ht-2])cylinder(r1=2,r2=4,h=3);
    translate([w-5,yh1,ht-2])cylinder(r1=2,r2=4,h=3);
  }
}

module num_to_str(number, block_size, height) {
	numbers_size = ceil(log(number + 1) / log(10));
	for (loc = [0:numbers_size - 1]) {
		translate([0, (numbers_size - loc - 1) * block_size * 8, 0]) {
			if (floor(number / pow(10, loc)) % 10 == 0)
				8bit_char("0", block_size, height);
			if (floor(number / pow(10, loc)) % 10 == 1)
				8bit_char("1", block_size, height);
			if (floor(number / pow(10, loc)) % 10 == 2)
				8bit_char("2", block_size, height);
			if (floor(number / pow(10, loc)) % 10 == 3)
				8bit_char("3", block_size, height);
			if (floor(number / pow(10, loc)) % 10 == 4)
				8bit_char("4", block_size, height);
			if (floor(number / pow(10, loc)) % 10 == 5)
				8bit_char("5", block_size, height);
			if (floor(number / pow(10, loc)) % 10 == 6)
				8bit_char("6", block_size, height);
			if (floor(number / pow(10, loc)) % 10 == 7)
				8bit_char("7", block_size, height);
			if (floor(number / pow(10, loc)) % 10 == 8)
				8bit_char("8", block_size, height);
			if (floor(number / pow(10, loc)) % 10 == 9)
				8bit_char("9", block_size, height);
		}
	}
}
module nutSizerExperimentalColorslice()
{
colorslice=0.9;
difference()
{
  nutSizer();// Basic nutsizer
 
 //translate([w/3,L/10,0])cube([w/3,6*L/10.,ht-colorslice+.001]);

 translate([w/2,L/7,-0.001]) hexagon(25.4*9./8. + 1.5*kerf, ht-colorslice -1);
 translate([w/2-6.5*Tsz,L/7,-0.001])mirror([1,0,0])rotate([0,0,90])8bit_char("9", Tsz,ht-4);
 translate([w/2        ,L/7,-0.001])mirror([1,0,0])rotate([0,0,90])8bit_char("/", Tsz,ht-4);
 translate([w/2+6.5*Tsz,L/7,-0.001])mirror([1,0,0])rotate([0,0,90])8bit_char("8", Tsz,ht-4);

 translate([w/2,L/2.5,-0.001]) hexagon(25.4*8./8. + 1.5*kerf, ht-colorslice -1);
 translate([w/2,L/2.5,-0.001])mirror([1,0,0])rotate([0,0,90])8bit_char("1", Tsz,ht-4);

 translate([w/2,L/1.6,-0.001]) hexagon(25.4*7./8. + 1.5*kerf, ht-colorslice -1);
 translate([w/2-6.5*Tsz,L/1.6,-0.001])mirror([1,0,0])rotate([0,0,90])8bit_char("7", Tsz,ht-4);
 translate([w/2        ,L/1.6,-0.001])mirror([1,0,0])rotate([0,0,90])8bit_char("/", Tsz,ht-4);
 translate([w/2+6.5*Tsz,L/1.6,-0.001])mirror([1,0,0])rotate([0,0,90])8bit_char("8", Tsz,ht-4);

  //translate([0,0,ht-colorslice])cube([w,L,ht]); // Uncomment this line to get just the lower body, to print first in one color
  //translate([0,0,-1*colorslice])cube([w,L,ht]); // Uncomment this line to get just the top mm, to print last in a different color
}
}

