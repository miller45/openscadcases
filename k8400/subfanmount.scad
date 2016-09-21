//0.5 dick 1.5 tief
// screws 32x32 case 40x40x20

de=20;
id=32;
cx=40;
cy=cx;
fly=20;
th=1.5;
rec=3;
gap=4.2;
sd=4.3;
sofs=(cx-id)/2;
cd=37.5;
cofs=(cx-cd)/2;
//color("brown")translate([0,-rec,th])cube([cx,20,cy]);
difference(){
   part();
   screwholes();
   centerhole();
}


module part(){
 union(){
	translate([0,de-rec,th])	cube([40,rec,40]);
	translate([0,0,0])cube([cx,de,th]);
	translate([0,fly-th*3,-(gap)])cube([40,th*3,gap]); 
	translate([0,de-de*1.3,-(th+gap)])cube([cx,de*1.3,th]);
 }

  //translate([sofs,20,th+sofs]) # cube([id,1,id]); 
}

module screwholes(){
   orix=sofs;
   oriy=th+sofs;
  	//bot
   translate([orix,fly-rec*1.5,oriy]) rotate([0,90,90]) cylinder(d=sd,h=rec*2,$fn=64);
   translate([orix+32,fly-rec*1.5,oriy]) rotate([0,90,90]) cylinder(d=sd,h=rec*2,$fn=64);
   //top
   translate([orix,fly-rec*1.5,oriy+id]) rotate([0,90,90]) cylinder(d=sd,h=rec*2,$fn=64);
   translate([orix+32,fly-rec*1.5,oriy+id]) rotate([0,90,90]) cylinder(d=sd,h=rec*2,$fn=64);
}

module centerhole(){
   orix=cofs;
   oriy=th+cofs;
   smi=0.01;

   translate([cd/2+orix,fly-rec-smi/2,cd/2+oriy]) rotate([0,90,90]) ricylinder(r1=cd/2,r2=cd/2,h=rec+smi,$fn=128);
}

module ricylinder(r1,r2,h,$fn=16){
  union(){
  cylinder(r1=r1*1.02,r2=r2,h=h*0.11,$fn=$fn);
  translate([0,0,h*0.1]) cylinder(r1=r1,r2=r2,h=h*0.8,$fn=$fn);
  translate([0,0,h*0.1+h*0.79]) cylinder(r1=r1,r2=r2*1.02,h=h*0.11,$fn=$fn);	
  }
}