org_dynamo_od=20.5;//inner diameter of dynamo
dynamo_od=org_dynamo_od+0.1;
ada_thick=4; //thickness of adapter ring
ada_height=10;
ada_bul_height=4;
ada_lid_height=2;
ada_mot_height=10;
ada_mot_id=4+0.5;
ada_mot_th=4;
ada_mot_pinh=3.2;
ada_mot_pind=1.3;
$fn=128;
cyid=dynamo_od;
cyod=cyid+ada_thick;    


module dynamocoupler(){
   
    union(){
        difference(){
            cylinder(d=cyod,h=ada_height);
            translate([0,0,-0.5])cylinder(d=cyid,h=ada_height+1);
        };
        translate([0,0,ada_height]){
            difference(){
                cylinder(d=cyod,h=ada_bul_height);
                translate([0,0,-0.5]) cylinder(d=cyid,h=ada_bul_height+1);
            };
        }
        translate([0,0,ada_height+ada_bul_height]){
            cylinder(d=cyod,h=ada_lid_height);
        }
        pinl=(ada_mot_id+ada_mot_th+1);
        translate([0,0,ada_height+ada_bul_height+ada_lid_height]){
            difference(){
                cylinder(d=ada_mot_id+ada_mot_th,h=ada_mot_height);
                translate([0,0,0.5]) cylinder(d=ada_mot_id,h=ada_mot_height);
                translate([-pinl/2,0,ada_mot_pinh]) 
                    rotate([0,90,0]) 
                        cylinder(d=ada_mot_pind,h=pinl);
            }
            
        }
            
    }
    
}

module cutty(od,id,stepdeg,gapdeg){
    cinh=ada_height+1;
    cutth=od-id;
    for (i=[0:(stepdeg+gapdeg):360]){
        //echo (i);
        rotate([0,0,i])
            translate([0,id/2+cutth/2,cinh/2-0.1])             
               cube([0.5,cutth,cinh],center=true);
    }
}

difference(){
    dynamocoupler();
    cutty (cyid+0.6,cyid-0.01,5,1);
}

