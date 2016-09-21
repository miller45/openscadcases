// DC-DC boost converter (eg. 12V -> 24V) based on UC3843A (100 kHz)
// www.ebay.com/itm/271416568548
// Oct. 29, 2014  J. Beale
// version 1.0

// ==============================================================
slop = 0.2;  // size by which ID of holes shrinks during print
fn = 50;     // facets on a cylinder
eps = 0.03;  // a small number

BRDX = 60;  // PCB length //65.4
BRDY = 43;  // PCB width //36.7
BRDZ = 1.6;    // PCB thickness
MHID = 3.05;  // mounting hole ID
MHXOFF = 2+3.05/2;  // mounting hole X offset from edge //3.5
MHYOFF = 1.2+3.05/2;  // mounting hole Y offset from edge //5.2
BKOX = 47.8; // bottom keepout X
BKOY = 18;   // bottom keepout Y
BKOZ = 3;  // bottom keepout Z
HSX = 46; // heatsink length //45.9
HSY = 10.1; // heatsink width
HSZ = 17.5; // heatsink height
HSSX = 2.2; // heatsink slot width
HSSY = HSY-2.6; // heatsink slot depth
HSSsp = 35/7; // heatsink slot spacing
HSSXoff = 1.0; // heatsink slot offset
HSYoff = 14; // heatsink offset from center, Y axis
TROD = 27; // toroid OD
TRZ = 13.2; // toroid Z height (incl. wire windings)
TRXoff = 12.8; // center offset of toroid
CAPOD = 13.2; // filter cap OD
CAPZ = 21.6; // filter cap Z height
CAPXoff = 13; // filter cap X offset
CAPYoff = 6.8; // filter cap Y offset
TBX = 7.6;  // terminal block X
TBY = 20;   // terminal block Y
TBZ = 11.1; // terminal block Z
TBXoff = 1.4; // terminal block offset from edge
TRIMX = 5.1; // trimmer X
TRIMY = 9.52; // trimmer Y
TRIMZ = 11.7-1.6; // trimmer Z
TRIMXoff = BRDX/2 - 1.2; // trimmer X offset from center
TRSOD = 2.25; // trimmer screw OD
TRSZ = 1.5; // trimmer screw Z

// TO-220 heatsink
module Heatsink() {
  difference() {
    cube([HSX,HSY,HSZ]);
    for ( i = [0 : 9]) {
      translate([HSSXoff+(i*HSSsp),-eps,-eps]) cube([HSSX,HSSY,HSZ+eps*2]);
    }
  }
}

module DCBoost() {
 difference() {
  union() {
      // main PCB
    translate([0,0,BRDZ/2]) cube([BRDX,BRDY,BRDZ], center=true);
      // trimmer (output voltage adjust)
    translate([-TRIMXoff,0,BRDZ]) union() {
        color("blue") cube([TRIMX,TRIMY,TRIMZ]);
        color("yellow") translate([TRSOD/2,TRSOD/2,TRIMZ]) cylinder(d=TRSOD,h=TRSZ,$fn=16);
    }
      // TO-220 heatsinks
    color("grey") rotate([0,0,180]) translate([-HSX/2,-HSYoff-HSY,BRDZ]) Heatsink() ;
    color("grey") translate([-HSX/2,-HSYoff-HSY,BRDZ])  Heatsink() ;
      // terminal block
    color("green") translate([(BRDX-TBX)/2-TBXoff,0,BRDZ+TBZ/2]) 
        cube([TBX,TBY,TBZ],center=true);
      // toroidal inductor
    color([.3,.2,.2]) translate([-TRXoff,0,BRDZ]) cylinder(d=TROD, h=TRZ, $fn=30);
      // 2 filter caps
    color([.3,.3,.3]) translate([CAPXoff,CAPYoff,BRDZ]) cylinder(d=CAPOD, h=CAPZ, $fn=30);
    color([.3,.3,.3]) translate([CAPXoff,-CAPYoff,BRDZ]) cylinder(d=CAPOD, h=CAPZ, $fn=30);

      // bottom keep-out zone for components & added wires
    color([0.4,0.4,0.6]) translate([0,0,-BKOZ/2])  cube([BRDX,BKOY,BKOZ], center=true);
    color([0.4,0.4,0.6]) translate([0,0,-BKOZ/2])  cube([BKOX,BRDY,BKOZ], center=true);
  }
  // 4x mounting holes at corners
  translate([(BRDX/2-MHXOFF),(BRDY/2-MHYOFF),-BRDZ])
      cylinder(d=MHID,h=BRDZ*10,$fn=fn);
  translate([-(BRDX/2-MHXOFF),(BRDY/2-MHYOFF),-BRDZ])
      cylinder(d=MHID,h=BRDZ*10,$fn=fn);
  translate([(BRDX/2-MHXOFF),-(BRDY/2-MHYOFF),-BRDZ])
      cylinder(d=MHID,h=BRDZ*10,$fn=fn);
  translate([-(BRDX/2-MHXOFF),-(BRDY/2-MHYOFF),-BRDZ])
      cylinder(d=MHID,h=BRDZ*10,$fn=fn);    
    }
}

// =========================================
CBTH = 2;  // case thickness
CBCL = 0.4; // clearance to PCB
CBX = BRDX + (CBTH+CBCL)*2;  // case bottom X size
CBY = BRDY + (CBTH+CBCL)*2; // case bottom Y size
CBZ = BRDZ + BKOZ + CBTH; // case bottom Z size
SBOD = 6.5; // mounting screw boss OD
SBID = 3; // mounting screw boss ID
SBZ = 4; // mounting screw boss height
CBNY = 19; // width of notch in case bottom (for wires)
TRMZ = 11.6+5; // height of top of trimmer pot adj above board, plus clearance
MSHD = 5.35 + slop; // diameter of head of M3 mounting screw

// =====  TOP PART of case ========

// ---------------------------------------------------------------------------
CTZ = CAPZ + CBTH + CBCL;  // height of case top (caps are tallest item)
HSCL = 0.3; // heatsink clearance

module CaseT1() { // outer shell of case top
  difference() {
    translate([0,0,CTZ/2]) cube([CBX,CBY,CTZ], center=true); // shell
    translate([0,0,(CAPZ+CBCL)/2-eps]) cube([BRDX+CBCL*2, BRDY+CBCL*2,CAPZ+CBCL], center=true); // hollow
    translate([-HSX/2-HSCL/2,-HSYoff-HSY,-HSCL]) cube([HSX+HSCL*2,HSY,HSZ+HSCL]); // notch for heatsink
    rotate([0,0,180]) translate([-HSX/2-HSCL/2,-HSYoff-HSY,-HSCL]) cube([HSX+HSCL,HSY,HSZ+HSCL*2]); // notch for heatsink
      
  }
} // end module CaseT1()

HSBY = 2.60;  // width of heatsink root 
HSBCO = 27.9/2; // heatsink edge center offset

module CaseT2() { // case top 
  difference() {
    union() {
        CaseT1();
        translate([-TRIMXoff+TRSOD/2,TRSOD/2,TRMZ]) 
          cylinder(d=TRSOD+2,h=CTZ-TRMZ,$fn=16); // shaft surrounding hole for V_adjust

        // walls for screw terminal nook
        translate([(BRDX/2)-TBXoff+eps,0,BRDZ+TBZ-.7]) 
          cube([TBX*2+2,TBY+2,CTZ],center=true);
        
        // form wall to meet top of heatsink
        translate([-(HSX+2*CBTH)/2,HSBCO,HSZ+0.2]) cube([HSX+CBTH*2,HSBY+4,3]); 
        rotate([0,0,180]) translate([-(HSX+2*CBTH)/2,HSBCO,HSZ+0.2]) cube([HSX+CBTH*2,HSBY+4,3]); 

        // screw boss pillar
        translate([(BRDX/2-MHXOFF),(BRDY/2-MHYOFF),(CTZ-1)/2]) SBoss(CTZ-1);
        translate([-(BRDX/2-MHXOFF),(BRDY/2-MHYOFF),(CTZ-1)/2]) SBoss(CTZ-1);
        translate([(BRDX/2-MHXOFF),-(BRDY/2-MHYOFF),(CTZ-1)/2]) SBoss(CTZ-1);
        translate([-(BRDX/2-MHXOFF),-(BRDY/2-MHYOFF),(CTZ-1)/2]) SBoss(CTZ-1);
        
        translate([(BRDX/2-MHXOFF),(BRDY/2-MHYOFF),(CTZ-1)/2]) rotate([0,0,180]) SBS(CTZ-1);
        translate([-(BRDX/2-MHXOFF),(BRDY/2-MHYOFF),(CTZ-1)/2]) SBS(CTZ-1);
        translate([(BRDX/2-MHXOFF),-(BRDY/2-MHYOFF),(CTZ-1)/2]) rotate([0,0,180]) SBS(CTZ-1);
        translate([-(BRDX/2-MHXOFF),-(BRDY/2-MHYOFF),(CTZ-1)/2]) SBS(CTZ-1);

        
        } // end union
        
      // notch for screw terminal block
    translate([(BRDX/2)-TBXoff+eps,0,BRDZ+TBZ/2]) 
        cube([TBX*2,TBY,CTZ*2],center=true);
    translate([CBX/2+eps,-50,-eps]) cube([100,100,100]);
    translate([-TRIMXoff+TRSOD/2,TRSOD/2,TRIMZ]) 
            cylinder(d=TRSOD,h=CTZ*2,$fn=16); // hole for V_adjust
    translate([(BRDX-TBX)/2-TBXoff-5,0,(TBZ-2)/2-eps]) // notch for term.block
        cube([TBX,TBY,TBZ-2],center=true);
        // make notch to expose top of heatsink fins
    translate([-HSX/2,HSBCO+HSBY,HSZ-0.2]) cube([HSX,HSBY*4,50]); 
    rotate([0,0,180]) translate([-HSX/2,HSBCO+HSBY,HSZ-0.2]) cube([HSX,HSBY*4,50]); 
         // 4x through-holes for corner mounting screws
    translate([(BRDX/2-MHXOFF),(BRDY/2-MHYOFF),CTZ/2]) MHole(SBID,CTZ+eps);
    translate([-(BRDX/2-MHXOFF),(BRDY/2-MHYOFF),CTZ/2]) MHole(SBID,CTZ+eps);
    translate([(BRDX/2-MHXOFF),-(BRDY/2-MHYOFF),CTZ/2]) MHole(SBID,CTZ+eps);
    translate([-(BRDX/2-MHXOFF),-(BRDY/2-MHYOFF),CTZ/2]) MHole(SBID,CTZ+eps);
        // countersink for screw heads
    translate([(BRDX/2-MHXOFF),(BRDY/2-MHYOFF),20.1]) MHole(MSHD,20);
    translate([-(BRDX/2-MHXOFF),(BRDY/2-MHYOFF),20.1]) MHole(MSHD,20);
    translate([(BRDX/2-MHXOFF),-(BRDY/2-MHYOFF),20.1]) MHole(MSHD,20);
    translate([-(BRDX/2-MHXOFF),-(BRDY/2-MHYOFF),20.1]) MHole(MSHD,20);
        
    // translate([BRDX/2-MHXOFF,(BRDY/2-MHYOFF),0]) cube([100,100,100]); // DEBUG cutaway

  }
}  // end module CaseT2()


// =====  BOTTOM PART of case ======================================

module CaseB1() { // outer shell of case bottom
  difference() {
    translate([0,0,-CBZ/2]) cube([CBX,CBY,CBZ], center = true); // shell
    translate([0,0,-(BRDZ+BKOZ)/2 + eps ]) 
      cube([BRDX+CBCL*2,BRDY+CBCL*2,BRDZ+BKOZ], center = true); // hollow
    translate([0,0,-(BRDZ+BKOZ)/2 + eps ])
      translate([CBX/2,0,0]) cube([CBX,CBNY,BRDZ+BKOZ], center=true); // notch
    // translate([0,0,-50]) cube([100,100,100]);  // DEBUG cutaway
  }
}

module MHole(diam,len) { // hole for mounting screw
   cylinder(d=diam,h=len,$fn=35);
}

module SBoss(height) {  // mounting screw boss
    difference() {
       cylinder(d=SBOD,h=height,$fn=35,center=true);
       cylinder(d=SBID,h=height+eps,$fn=35,center=true);
     }
}

module SBS(height) {  // Screw Boss post support flange
BW = 3;
    translate([-5,-1,-height/2]) cube([BW,2,height],center=false);
}

module M3() { // mounting screw, M3 x 24.5 mm
FullZ = 26.8; // full length including head
HeadZ = 2.3;  // height of head
  cylinder(d=2.94, h=FullZ, $fn=10); // OD of thread, length incl. head
  translate([0,0,FullZ-HeadZ]) cylinder(d=5.3, h=HeadZ, $fn=14); // screw head 
}

module CaseB2() {
  difference() {
   union() {
     CaseB1();
     translate([(BRDX/2-MHXOFF),(BRDY/2-MHYOFF),-SBZ/2-BRDZ]) SBoss(SBZ);
     translate([-(BRDX/2-MHXOFF),(BRDY/2-MHYOFF),-SBZ/2-BRDZ]) SBoss(SBZ);
     translate([(BRDX/2-MHXOFF),-(BRDY/2-MHYOFF),-SBZ/2-BRDZ]) SBoss(SBZ);
     translate([-(BRDX/2-MHXOFF),-(BRDY/2-MHYOFF),-SBZ/2-BRDZ]) SBoss(SBZ);
   }
   // translate([BRDX/2-MHXOFF,(BRDY/2-MHYOFF),-50]) cube([100,100,100]); // DEBUG cutaway
   
 }
}

translate([0,100,BKOZ]) DCBoost();  // DC-Boost circuit PCB + electronics
translate([0,0,4.6-5]) CaseB2();  // bottom part of case
translate([0,0,BRDZ+BKOZ]) CaseT2(); // top part of case
// rotate([0,180,0]) translate([0,0,-CTZ]) CaseT2(); // top part of case

color("grey") translate([(BRDX/2-MHXOFF),(BRDY/2-MHYOFF),33+0.2]) M3();  
color("grey") translate([-(BRDX/2-MHXOFF),(BRDY/2-MHYOFF),33+0.2]) M3();  
color("grey") translate([(BRDX/2-MHXOFF),-(BRDY/2-MHYOFF),33+0.2]) M3();  
color("grey") translate([-(BRDX/2-MHXOFF),-(BRDY/2-MHYOFF),33+0.2]) M3();  // mnt.screw