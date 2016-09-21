
use <libraries\ISOThread.scad>;
$fn=30;

nidia=2.3;
ndia=3;
th=ndia-nidia;
len=15;

rotate([0,90,0])//y90
rotate([0,0,30]){//z30
difference(){
  my_hex_nut(ndia,odx=0,xtralen=len);
  for(i=[0:11]){
     rotate([0,0,i*30])
       translate([0.3,ndia/2-0.1,(len+0.1)/2])
   		  cube([0.2,th*1.3,len+0.2],center=true);
  }

}
}


module my_hex_nut(dia,odx=0,xtralen=0,hi)
{
	hi = rolson_hex_nut_hi(dia);

	difference()
	{
		cylinder(r = (rolson_hex_nut_dia(dia)+odx)/2,h = xtralen, $fn=6);
		translate([0,0,-0.1])	cylinder(r = nidia/2, h =0.2 +xtralen);
	}

}