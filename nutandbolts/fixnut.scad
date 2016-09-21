
use <libraries\ISOThread.scad>;
$fn=30;

nidia=3;
ndia=3;
th=ndia-nidia;
len=18;

rotate([0,90,0])//y90
rotate([0,0,30]){//z30

 
my_hex_nut(2,odx=0,xtralen=len);
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