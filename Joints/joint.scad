 sc=0.5;
 teardropradius=1.8;
module teardrop(r, h) {
	union(){
		cylinder(h=h,r=r, center = true, $fn=20);
		intersection() {
			rotate(45,[0,0,1]) 
			cube([2*r, 2*r, h], center = true);
			
			translate([1.75*r, 0, 0]) 
			cube([2*r, 2*r, h], center = true);
		}
	}
}

module bracket() {
	difference() {
		difference() {
			cylinder(r=20, h=60, $fn=20);
	
			translate([0,0,45])
			cube([50,20,40], center=true);
	
			translate([25,0,45])
			cube([30,50,40], center=true);
	
			translate([-25,0,45])
			cube([30,50,40], center=true);

			translate([0,0,50])
			rotate(90, [1,0,0])
			rotate(90, [0,0,1])
			teardrop(r= teardropradius, h=60);
	
			translate([20,0,25])
			rotate(90, [1,0,0])
			cylinder(r=10, h=60, center=true);
	
			translate([-20,0,25])
			rotate(90, [1,0,0])
			cylinder(r=10, h=60, center=true);
		}

		translate([0,0,50])
		difference() {
			cube([60,60,50], center=true);

			rotate(90, [1,0,0])
			cylinder(r=10, h=60, center=true);	
			
			translate([0,0,-20])
			cube([60,60,40], center=true);
		}
	}
}

module ball() {
	scale(0.9)
	difference() {
		intersection() {
			cube(size=20, center=true);
			sphere(r=15);
		}

		rotate(90, [1,0,0])
		rotate(90, [0,0,1])	
		teardrop(r=teardropradius, h=30);

		translate([10,0,0])
		rotate(180, [1,0,0])	
		rotate(90, [0,1,0])	
		teardrop(r=teardropradius, h=10);

		translate([-10,0,0])
		rotate(180, [1,0,0])	
		rotate(90, [0,1,0])	
		teardrop(r=teardropradius, h=10);
	}
}
module ballex() {
	scale(0.9)
	difference() {
		intersection() {
			cube(size=20, center=true);
			sphere(r=15);
		}

		rotate(90, [1,0,0])
            rotate(90, [0,0,1])	
                teardrop(r=teardropradius, h=30);


		translate([0,0,3.5])
            rotate(180, [1,0,0])	
                rotate(90, [0,1,0])	
                    teardrop(r=teardropradius, h=30);
	}
}

module motorpin(){
    smi=0.1;
    ch=6;
    d=5.4;
    cux=1;
    cuy=10;
   /* 
    render() difference()
    {
        cylinder(r=d/2,h=ch,$fn=64);
            translate([d/2-cux,-cuy/2,-smi/2]) cube([cux,cuy,ch+smi]);
                translate([-d/2,-cuy/2,-smi/2]) cube([cux,cuy,ch+smi]);
    }*/
    
    linear_extrude(height=8.5,convexity=10) polygon( points=[ [1.5760,-2.3620], [1.0860,-2.6240], [0.5520,-2.7860], [0.0000,-2.8400], [-0.5560,-2.7860], [-1.0880,-2.6240], [-1.5780,-2.3620], [-1.7040,-2.3120], [-1.7040,2.3100], [-1.5780,2.3600], [-1.0880,2.6220], [-0.5560,2.7840], [0.0000,2.8380], [0.5520,2.7840], [1.0860,2.6220], [1.5760,2.3600], [1.7020,2.3100], [1.7020,-2.3120], [1.5760,-2.3620]] );    
}

module joint() {
   
    *difference(){
        bracket();
        translate([0,0,-0.01]) 
            scale(1/sc) //compensate for global scale: pinsize is given
                motorpin();
    }

	translate([0,0,50])
        ballex();

	*rotate(180, [0,1,0])
        rotate(90, [0,0,1])
            translate([0,0,-100])
                bracket();
}




scale(sc) joint();
    


