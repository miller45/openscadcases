include <..\lib\morphology.scad>;
sqfac=25/30;
sqw=32.9*sqfac;
sqh=36.6*sqfac;
fans=25;//25.2;
fanscrdist=21.5;//distance of screws 


//color("red")translate([-1,-1,0])cube([1,1,1]);
//translate([3.228,-4.2675,21.48])rotate([0,180,0])import(file = "PeekFanv1-1.stl");

//clips paras
csx=8.48;
csy=9.23;
clos=1;
oz=-0.01;
cyr=2.2/2;
cyxofs=1.9;
cyyofs=1.44;
hscr=3.2/2;
fscr=22/2;
fyofs=-10;


color("green")
difference(){
union(){
   translate([1.9,fyofs,2.3]) rotate([0,-90,0]){
  	 //sideflap
		
	   difference(){
        union(){
				translate([-0.01,0,3])linear_extrude(height=5.151)shape1();
				translate([-0.01,0,5.15])linear_extrude(height=14.26)shape2();
			}//uniun
			translate([-7.29,61.1,16.91]) rotate([90,0,0]) cylinder(r=hscr,h=5,$fn=32);
			translate([-9.61-fscr*0.9,61.1,(5.15+14.26)/2]) rotate([90,0,0]) cylinder(r=fscr,h=5,$fn=64);
			
	   }//diff
     translate([1.4,10,3])
			cube([6.7,40,5.1]);
   }//translate
 
	   //frame
		translate([-1.3-4,0,7.5]){
	 difference(){
				translate([3.54,2,0])linear_extrude(height=5.151)outset(d=2,$fn=16)square([sqw,sqh]);
				translate([3.54+0.74,2+2.3,-0.1])linear_extrude(height=5.351)square([fans*1.017,fans*1.027]);
			}
		};

		// clips
	translate([-3.6,0.5,7.5]){
		   //lower left
		   render() difference(){
				translate([csx,csy,5.15+oz]) rotate([0,0,180]) linear_extrude(height=3,scale=[0.8,0.8]) outset(d=clos,$fn=24) square([csx-clos,csy-clos]);
				translate([csx/2+1,csy/2+2,6.59+oz-0.1])
					din_hex_nut_shim(2,sc=1.21);
				translate([csx/2+1,csy/2+2,5.15+oz-0.1]) 
					cylinder(r=cyr,h=3.2,$fn=64);
		};
		   //upper right
		   render() difference(){
				translate([fans-(sqw-fans-0.6+1),fans-(sqh-fans-csy/2-1.2+2),5.15+oz]) rotate([0,0,0]) linear_extrude(height=3,scale=[0.8,0.8]) outset(d=clos,$fn=24) square([csx-clos,csy-clos]);
			   translate([csx/2+0.5+fanscrdist-cyr,csy/2+1.2+fanscrdist-cyr,6.59+oz-0.1])
					din_hex_nut_shim(2,sc=1.21);
				translate([csx/2+0.5+fanscrdist-cyr,csy/2+1.2+fanscrdist-cyr,5.15+oz-0.1]) 
					cylinder(r=cyr,h=3.2,$fn=64);
			}
	}
//	}



}//union
//translate([-20,-1,-10]) cube([60,70,10]);
}//difference


//translate([3.54+0.74+1.2+1.1,2+2.3+1.2+1.1,-0.1]) square([0.1,0.1]);



module shape1() {
    polygon([[-3.5,21],[-4.76,32.1],[-4.76,41],[-4.76,57],[-10.61,57],[-10.61,61],
[-2,61],[0.47,60],[1.54,57.6],[1.54,41],[1.54,10],[0,10]]);
}

module shape2() {
    polygon([[-4.76,34.1],[-4.76,57],[-10.61,57],[-10.61,61],
[-2,61],[0.47,60],[1.54,57.6],[1.54,34.1]]);
}



module din_hex_nut_shim(dia,ro=0,sc=1.1)
//  dia=diameter, 6=M6 etc.
{
	hi = din934_hex_nut_hi(dia);
	rotate([0,0,ro]) scale([sc,sc,sc]) cylinder(r = din934_hex_nut_dia(dia)/2,h = hi, $fn=6);
}


function din934_hex_nut_dia(dia) = lookup(dia, [
[2,4.38],[3,6.08],[4,7.74],[5,8.63],[6,10.89],[8,14.2],[10,18.72],[12,20.0],[16,26.8],[20,33.0],[24,39.55],[30,50.85],[36,60.79]]);

function din934_hex_nut_hi(dia) = lookup(dia, [
[2,1.6],[3,2.4],[4,3.2],[5,4],[6,5.0],[8,6.5],[10,8],[12,10],[16,13],[20,16],[24,19],[30,24],[36,29]]);