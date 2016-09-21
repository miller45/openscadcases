
use <libraries/ISOThread.scad>;
$fn=30;

nidia=3;
ndia=3;
th=ndia-nidia;
len=4;
sc=1.15;

//plate
pthick=3;
holedia=2.8;	
offset=1.2;
holer=holedia/2;
reachin=4.8;
reachout=4;
   cw=reachin+reachout;
      ch=cw;
   mc=1.2;
	   mh=1;
//design();
make();

module make(){
   union(){
		difference(){
			translate([-(reachin-reachout),-(reachin-reachout),0]){
				cube([cw,ch,pthick],center=true);   
			};
			translate([0,0,-4.51+pthick]){
				scale([sc,sc,1])
					my_din_hex_nut(2);
            cylinder(r=1.3,h=pthick+0.1);
			};
		};
	
		translate([-(reachin/2+mc/2),-(reachin/2+mc/2),pthick/2+mh/2])
		color("Green") cube([mc,mc,mh],center=true);

   }
}



module design(){
 difference(){
   translate([-(reachin-reachout),-(reachin-reachout),0]){   
	   cube([cw,ch,2],center=true);   
   }
   translate([0,0,-1.5]){
     scale([sc,sc,3])
	   my_din_hex_nut(2);

   }
}
translate([0,0,2]){
      my_din_hex_nut(2);
 }


translate([0,0,5]){
      my_din_hex_nut(3);
 }


}



module my_din_hex_nut(dia,hi)
// make an DIN nut 
//  dia=diameter, 6=M6 etc.
{
	hi = din934_hex_nut_hi(dia);
	difference()
	{
		cylinder(r = din934_hex_nut_dia(dia)/2,h = hi, $fn=6);

	}
}