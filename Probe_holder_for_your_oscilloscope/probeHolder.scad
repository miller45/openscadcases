probeHolder(2,20,11.5);

module probeHolder(pcs, probeH,probeD){
  holeR = 4/2;
  
  difference(){ //mount plate
    union(){
      translate(v=[10,0,0]) cube(size=[(pcs+1)*16,probeH,2], center=false);
      translate(v=[10,probeH/2,0]) cylinder(r=probeH/2, h=2, center=false, $fn=35);
      translate(v=[8+(pcs+1)*16,probeH/2,0]) cylinder(r=probeH/2, h=2, center=false, $fn=35);
    }
    translate(v=[10,probeH/2,0]) cylinder(r=holeR, h=10, center=true, $fn=16);
    translate(v=[8+(pcs+1)*16,probeH/2,0]) cylinder(r=holeR, h=10, center=true, $fn=16);
  }
  for ( z = [1:pcs]) {
    translate( [16*z, 0, 0] ) ph(probeH,probeD);
  }
}

module ph(probeH,probeD=11){
  difference(){
    cube(size=[16,probeH,18], center=false);
    translate(v=[8,probeH+2,10]) rotate(a=[90,0,0]) cylinder(d=probeD, h=probeH+4, center=false, $fn=40);
    translate(v=[8,probeH+2,18]) rotate(a=[90,0,0]) cylinder(d=probeD, h=probeH+4, center=false, $fn=40);
	
	translate(v=[08,-6,10]) sphere(10, $fn=64);
	translate(v=[08,26,10]) sphere(10, $fn=64);
  }
}
