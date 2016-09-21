org_mot_od=35;
mot_od=org_mot_od+0.7;
br_wd=15;
br_th=5;
br_h=mot_od/2+br_th;
br_sp=mot_od+br_th;
br_lth=4;
cl_h=mot_od+br_th;
$fn=128;


clamp_and_flap();

module clamp_and_flap(){
    clamp();
    translate([br_sp/2,-br_wd/2,0]) flapr();
    translate([-br_sp/2,-br_wd/2,0]) flapl();
}

module clamp(){    
    cl_xtra=4;
    translate([0,0,mot_od/2]){
        difference(){
            translate([0,0,br_th/2+cl_xtra/2]) 
                cube([br_sp,br_wd,cl_h+cl_xtra],center=true);
            union(){
                translate([0,-br_wd/2-0.5,+cl_xtra]) rotate([-90,0,0]) cylinder(d=mot_od,h=br_wd+1);
                translate([0,-0.1,-mot_od/4+cl_xtra/2]) cube([mot_od,br_wd+1,mot_od/2+cl_xtra],center=true);
            }
        }
    }
  
}

module bracket_and_flap(){
    bracket();
    translate([br_sp/2,0,0]) flapr();
    translate([-br_sp/2,0,0]) flapl();

};

module flapr(){
     flscrd=3.5;
    difference(){
        cube([15,br_wd,br_lth]);
        translate([15/2,br_wd/2,-0.1]) cylinder(r1=flscrd/2,r2=flscrd/2*2,h=br_lth+0.2,$fn=32);
    }
}
module flapl(){
    flscrd=3.5;
    translate([-15,0,0]){
        
        difference(){
            cube([15,br_wd,br_lth]);
            translate([15/2,br_wd/2,-0.1]) cylinder(r1=flscrd/2,r2=flscrd/2*2,h=br_lth+0.2,$fn=32);
        }
    }
}

module bracket(){
    difference(){
        translate([-br_sp/2,0,0]) cube([br_sp,br_wd,br_h]);
        translate([0,-0.5,br_h]) rotate([-90,0,0]) cylinder(d=mot_od,h=br_wd+1);
    };

}
