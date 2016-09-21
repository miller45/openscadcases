org_mot_od=35;
mot_od=org_mot_od+0.7;

org_dyn_od=33.6;
dyn_od=org_dyn_od+0.7;


dyn_od1_sm=15+0.7;
dyn_od2_sm=14.6+0.7;


comp_h=(mot_od-dyn_od)/2;//ausgleich um auf die gleiche höhe wie motor zu kommen
echo (comp_h);

part=0.7;
br_wd=15;
br_th=5;
br_h=dyn_od*part+br_th;
br_of=dyn_od/2+br_th+comp_h;
br_sp=dyn_od+br_th;//span of bracket
br_lth=4;
cl_h=dyn_od+br_th;
$fn=128;


//clamp_and_flap();
 //bracket_and_flap();
//bracket_sm();
clamp_sm_and_flap();

module clamp_and_flap(){
    clamp();
    translate([br_sp/2,-br_wd/2,0]) flapr();
    translate([-br_sp/2,-br_wd/2,0]) flapl();
}


module clamp(){    
    cl_xtra=4;
    translate([0,0,dyn_od/2]){
        difference(){
            translate([0,0,br_th/2+cl_xtra/2]) 
                cube([br_sp,br_wd,cl_h+cl_xtra],center=true);
            union(){
                translate([0,-br_wd/2-0.5,+cl_xtra]) rotate([-90,0,0]) cylinder(d=dyn_od,h=br_wd+1);
                translate([0,-0.1,-dyn_od/4+cl_xtra/2]) cube([dyn_od,br_wd+1,dyn_od/2+cl_xtra],center=true);
            }
        }
        //spoint([0,-br_wd/2-0.5,+cl_xtra]);
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
        translate([0,-0.5,br_of]) rotate([-90,0,0]) cylinder(d=dyn_od,h=br_wd+1);
        echo(br_of);
    };
    //spoint([0,-0.5,br_of]);
}

module bracket_sm(){    
    comp_h=(mot_od-dyn_od1_sm)/2;
    sbr_sp=dyn_od1_sm;
    spart=1;
    sbr_h=dyn_od1_sm*spart+br_th;
    sbr_of=dyn_od1_sm/2+br_th+comp_h;
   
    
    difference(){
        translate([-sbr_sp/2,0,0]) cube([sbr_sp,br_wd,sbr_h]);
        
        translate([0,-0.1,sbr_of]) 
            rotate([-90,0,0]) 
                cylinder(d1=dyn_od1_sm,d2=dyn_od2_sm,h=br_wd+0.2);
    };

}

module clamp_sm_and_flap(){
    sbr_sp=dyn_od1_sm+0.1;
    clamp_sm(sbr_sp);
    translate([sbr_sp/2,0,0]) flapr();
    translate([-sbr_sp/2,0,0]) flapl();
}


module clamp_sm(sbr_sp){    
    zsri=0.2; //shrink z so clamp is tight
    comp_h=(mot_od-dyn_od1_sm)/2;
    
    spart=1;
    sbr_h=dyn_od1_sm*spart+br_th;
    sbr_of=dyn_od1_sm/2+br_th+comp_h;
    outer_sbr_sp=sbr_sp+br_lth;
    difference(){        
        translate([-outer_sbr_sp/2,0,0]) 
            cube([outer_sbr_sp,br_wd,sbr_of+dyn_od1_sm/2+2-zsri]);
        union(){
            translate([-sbr_sp/2,-0.1,0]) cube([sbr_sp,br_wd+0.2,sbr_h+2.5-zsri]);            
            translate([0,-0.1,sbr_of-zsri]) 
                rotate([-90,0,0]) 
                    cylinder(d1=dyn_od1_sm,d2=dyn_od2_sm,h=br_wd+0.2);
        };
    }

}








module spoint(coord){
    cus=0.5;
     translate(coord) color("red") cube([cus,cus,cus],center=true);
}
