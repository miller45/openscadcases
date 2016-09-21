
  

restde=16;
backde=14;
backiw=118;//back inner width
backxtraraillen=24; // xtra rail length to go to back
restth=1.2;
endnar=1; //mm narrowing in the back area

module rackhook(){
  raillen=75;
  xtraraillen=20;
  railh=13;
  railth=1;


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
	translate([-backxtraraillen,-restde,0]) cube([backxtraraillen,restde-endnar,restth]);
  //restchamfer
  translate([0,-0.3,1.25]) rotate([0,90,0]) rotate([0,0,275]) cylinder(d=1.5,h=raillen+xtraraillen,$fn=3);
  //outer plate
  translate([(raillen/2-flapw/2),0,0]) cube([flapw,flapth,flaph]);
  //hook
  union(){
	  translate([(raillen/2-flapw/2)+flapw-hookw+xofs,flapth+hookgap,0]) cube([hookw,flapth,flaph]);
	  difference(){
		   union(){		
			  //spine of hook 
			  translate([(raillen/2+flapw/2)+xofs,0,0]) cube([spineth,spineth,flaph]);
		   }//union
		 //rounder of spine
		 translate([(raillen/2+flapw/2)+xofs,railth+hookgap/2,-0.05]) cylinder(d=hookgap,h=flaph+0.1,$fn=32);
	  }//difference
	  //end hook
	}

 //hook2
 translate([-42,0,])  union(){
	  translate([(raillen/2-flapw/2)+flapw-hookw+xofs,flapth+hookgap,0]) cube([hookw,flapth,flaph]);
	  difference(){
		   union(){		
			  //spine of hook 
			  translate([(raillen/2+flapw/2)+xofs,0,0]) cube([spineth,spineth,flaph]);
		   }//union
		 //rounder of spine
		 translate([(raillen/2+flapw/2)+xofs,railth+hookgap/2,-0.05]) cylinder(d=hookgap,h=flaph+0.1,$fn=32);
	  }//difference
	  //end hook
	}

  //inflaps 
  flapofs1=2;  
  flapofs2=hookw+2;
  flaplen=raillen*0.2;
  flapde=5;//restde*0.4;
	translate([flapofs1,railth,0]) cube([flaplen,flapde,railth]);
	translate([raillen-flapofs2-flaplen,railth,0]) cube([flaplen,flapde,railth]);

//chamfered_cube([flaplen,flapde,railth],d=0.1);
//cube([flaplen,flapde,railth]);
}

union(){
	//hooks
		rackhook();
	translate([0,-backiw,0]) mirror ([0,1,0]) 
		rackhook();
	//backrail
	translate([-backxtraraillen,-backiw+restde,0]) cube([backde,backiw-restde*2,restth]);
	translate([-backxtraraillen,-backiw+endnar,0]) cube([1,backiw-endnar*2,restth*2]);
}
