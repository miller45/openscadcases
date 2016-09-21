//////////////////////////////////////////////////////////////////////////////////////
///
///  FLEXBATTER: Flexing battery holder with built-in spring
///
///  This file generates battery holders for arbitrary cylindrical sizes.
///  The number of batteries and their size is fully parametrized.
///
///  The usual metallic spring at the minus pole is replaced by a
///  flexible printed spring, which is pressing the contacts firmly to 
///  the battery.
///
///  The contacts for the plus and minus pole can easily be made by
///  a few windings of the uninsulated ends of the connecting wires.
///  Each battery compartment contains are several holes to the outside
///  as well ad to the neighboring compartments, through which connecting
///  wires can be passed for easy configuring of parallel, serial or
///  balanced-serial battery packs.
///  
///  The preconfigured battery sizes are:
///  AA, AAA, C, D, 18650(Li-Ion), 18650P(protected Li-Ion), CR123A(16340)
///  
///  Given that the printed plastic spring needs to be flexible, ABS is the material
///  of choice here.
///
//////////////////////////////////////////////////////////////////////////////////////
///
///  2014-09-09 Heinz Spiess, Switzerland
///
///  released under Creative Commons - Attribution - Share Alike licence (CC BY-SA)
//////////////////////////////////////////////////////////////////////////////////////

// build a cube with chamfered edges
module chamfered_cube(size,d=1){
   hull(){
     translate([d,d,0])cube(size-2*[d,d,0]);
     translate([0,d,d])cube(size-2*[0,d,d]);
     translate([d,0,d])cube(size-2*[d,0,d]);
   }
}


// draw an arc width height h between radius r1..r2 and angles a1..a2
module arc(r1,r2,h,a1=0,a2=0){
     if(a2-a1<=180){
        difference(){
           cylinder(r=r2,h=h);
           translate([0,0,-1])cylinder(r=r1,h=h+2);
	   rotate(a2)translate([-r1-r2,0,-1])cube([2*(r1+r2),2*(r1+r2),h+2]);
	   rotate(a1+180)translate([-r1-r2,0,-1])cube([2*(r1+r2),2*(r1+r2),h+2]);
        }
     } else {
           difference(){
              cylinder(r=r2,h=h);
              translate([0,0,-1])cylinder(r=r1,h=h+2);
              intersection(){
	       rotate(a2)translate([-r1-r2,0,-1])cube([2*(r1+r2),2*(r1+r2),h+2]);
	       rotate(a1+180)translate([-r1-r2,0,-1])cube([2*(r1+r2),2*(r1+r2),h+2]);
	      }
           }
     }
}

/////////////////////////////////////////////////////////////////////////////////
// sline - generate a "snake line" of width w and height h 
// with a arbitrary sequence of segments defined by a radius and a turning angle
//
//   angle[i] > 0  left turn / counter-clockwise
//   angle[i] < 0  left turn / clockwise
//   angle[i] = 0  straight segment with length radius[i]
//
/////////////////////////////////////////////////////////////////////////////////
// Heinz Spiess, 2014-09-06 (CC BY-SA)
/////////////////////////////////////////////////////////////////////////////////
module sline(angle,radius,i,w,h){
   scale([angle[i]>=0?1:-1,1,1])
      assign(r=abs(radius[i]))assign(a=angle[i])
         translate([a?r:0,0,0]){
	    translate([-w/2,-r-0.01,0])cube([w,0.02,h]); // tiny overlap!
            if(a)arc(r-w/2,r+w/2,0,a,h=h);
	    else if(r>0)translate([-w/2,-r,0])cube([w,r,h]);
      if(i+1<len(angle))
           rotate(angle[i])
	      translate([a?-r:0,a?0:-r,0])
	         sline(angle,radius,i+1,w,h);
  }
}


module rackhook(){
  raillen=75;
  xtraraillen=20;
  railh=14;
  railth=1;
  restth=1.2;
  restde=16;
  pegw=11;
  pegth=1.95;//1.8
  flapw=30;
  flaph=14;
  flapth=1;
  hookth=1;
  hookw=pegw*1.2;
  hookgap=pegth+0.1;
  spineth=flapth+hookgap+hookth;
  xofs=-10;


	//rail
	cube([raillen+xtraraillen,railth,railh]);
  //extrarail front
	//rest
	translate([0,-restde,0]) cube([raillen+xtraraillen,restde,restth]);
  //outer plate
  translate([(raillen/2-flapw/2),0,0]) cube([flapw,flapth,flaph]);
  //hook
  translate([(raillen/2-flapw/2)+flapw-hookw+xofs,flapth+hookgap,0]) cube([hookw,flapth,flaph]);

	difference(){
	   union(){		
		  //spine of hook 
		  translate([(raillen/2+flapw/2)+xofs,0,0]) cube([spineth,spineth,flaph]);
	   }//union
	 //rounder of spine
	 translate([(raillen/2+flapw/2)+xofs,railth+hookgap/2,-0.05]) cylinder(d=hookgap,h=flaph+0.1,$fn=32);
  }//difference
  //inflaps 
  flapofs1=2;  
  flapofs2=hookw+2;
  flaplen=raillen*0.2;
  flapde=5;//restde*0.4;
	translate([flapofs1,railth,0]) cube([flaplen,flapde,railth]);
	translate([raillen-flapofs2-flaplen,railth,0]) cube([flaplen,flapde,railth]);
  translate([0,-0.1,1.2]) #rotate([0,90,0]) rotate([0,0,275]) cylinder(d=1,h=raillen+xtraraillen,$fn=3);
//chamfered_cube([flaplen,flapde,railth],d=0.1);
//cube([flaplen,flapde,railth]);
}
//rackhook();
mirror ([0,1,0]) rackhook();

// uncomment as needed:

//flexbatterCR123A(n=2);
//rotate([0,0,0])translate([0,0,-9])flexbatter18650(n=1);
//translate([0,40,0])rotate([90,0,0])translate([0,0,-9])flexbatter18650(n=1);
//translate([0,80,0])rotate([180,0,0])translate([0,0,-9])flexbatter18650(n=1);
//translate([0,120,0])rotate([-90,0,0])translate([0,0,-9])flexbatter18650(n=1);
//translate([0,33,0])flexbatter18650(n=2);
//translate([0,90,0])flexbatter18650(n=3);
//translate([-90,33,0])flexbatter18650(n=4);
//translate([0,28,0])flexbatterAA(n=2);
//translate([0,50,0])flexbatterAAA(n=1);
//flexbatterC(n=1);
//flexbatterD(n=1);
