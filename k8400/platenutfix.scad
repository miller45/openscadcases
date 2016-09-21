make();
module make(){
  ofs=44;
  span=44*sqrt(2);
  pad=3;
  
  dia=9; 
	hi = 4;
  smi=0.1;
difference(){
  union(){
	//left
    translate([-(dia/2*1.1+pad),-(dia/2+pad),0]) cube([dia+pad*2,dia+pad*2+ofs,hi]);
    //right
    translate([ofs-(dia/2*0.9+pad),-(dia/2+pad),0]) cube([dia+pad*2,dia+pad*2+ofs,hi]);
    //bottom
    translate([-(dia/2+pad),-(dia/2+pad),0]) cube([dia+pad*2+ofs,dia+pad*2,hi]);
    //top
    translate([-(dia/2+pad),ofs-(dia/2+pad),0]) cube([dia+pad*2+ofs,dia+pad*2,hi]);
  }

  translate([0,0,-smi/2]) cylinder(r = dia/2,h = hi+smi, $fn=6);
  translate([0,ofs,-smi/2]) cylinder(r = dia/2,h = hi+smi, $fn=6);
  translate([ofs,ofs,-smi/2]) cylinder(r = dia/2,h = hi+smi, $fn=6);
  translate([ofs,0,-smi/2]) cylinder(r = dia/2,h = hi+smi, $fn=6);
}
//   cube([dia,dia,1],center=true);
//   cube([dia,dia,1],center=true);
}
