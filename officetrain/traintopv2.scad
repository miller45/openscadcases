// 5 hoch
//19 breit
//58.8 lang
// 2mm loch in der mitte in deiner mindest. 5mm säule mitz finnen
// an der mitten seite 1.5 breite finnen beginened 4mm von unterkante
// s#äul bewginnt zwei mm von unterkante
// 2.5 von ausskannte extra finnem
holedia=2;
innerlen=58.8;
innerwidth=19;
wallw=1.4;
outerlen=innerlen+wallw*2;
outerwidth=innerwidth+wallw*2;
topwallh=2;

topouteredge=3;
minhfcarbottom=5;
carbottomh=2.5;
lowouterhang=0.8;
outerheight=topouteredge+minhfcarbottom+carbottomh+lowouterhang;
lowcuth=outerheight-topouteredge-topwallh;//cut from bottom
finw=1.5;//finnwidth
findepth=1;//finndepth
finofs=3.8;//finnofset from ground
dcolmagic=0.5;
dcolofs=2.5;
dcolh=lowcuth-dcolofs; //center col height
dcolz=(dcolh/2)+lowouterhang+dcolofs/2+dcolmagic;//+dcolmagic;
finh=lowcuth;
outerfinofs=2.5;

columnw=5.5; //5 org
echo(outerheight);


traintop();

module traintop(){
    smi=0.01;
    xa=0.2;   
    bofs=lowouterhang+carbottomh;  
    
    difference(){    
        cube([outerwidth,outerlen,outerheight],center=true);        
        //topcut
        translate([0,0,outerheight/2-topouteredge/2+smi])
            cube([innerwidth,innerlen,topouteredge],center=true);
        //bottomcut        
     
            translate([0,0,-outerheight/2+lowcuth/2-smi]) 
                cube([innerwidth,innerlen,lowcuth],center=true);     
      
        //central hole
       translate([0,0,-outerheight/2-0.5])
           cylinder(d=holedia,h=outerheight*1.1,$fn=64);
    }
    //add middle finns    
    translate([innerwidth/2-findepth/2,0,-outerheight/2+lowcuth/2+finofs/2])
        cube([findepth,finw,finh-finofs],center=true);
    
    translate([-innerwidth/2+findepth/2,0,-outerheight/2+lowcuth/2+finofs/2])
        cube([findepth,finw,finh-finofs],center=true);
    // add fins there
    translate([innerwidth/2-findepth/2,innerlen/2-outerfinofs-finw/2,-outerheight/2+lowcuth/2+finofs/2])
        cube([findepth,finw,finh-finofs],center=true);
    
    translate([-innerwidth/2+findepth/2,innerlen/2-outerfinofs-finw/2,-outerheight/2+lowcuth/2+finofs/2])
        cube([findepth,finw,finh-finofs],center=true);
    
    // and add fins thore
    translate([innerwidth/2-findepth/2,-innerlen/2+outerfinofs+finw/2,-outerheight/2+lowcuth/2+finofs/2])
        cube([findepth,finw,finh-finofs],center=true);
    
    translate([-innerwidth/2+findepth/2,-innerlen/2+outerfinofs+finw/2,-outerheight/2+lowcuth/2+finofs/2])
        cube([findepth,finw,finh-finofs],center=true);
    
    //centercolumn                
    
    difference(){
       translate([0,0,-outerheight/2+dcolz]) 
            cube([columnw,columnw,dcolh],center=true);
        translate([0,0,-outerheight/2-0.5])
           cylinder(d=holedia,h=outerheight*1.1,$fn=64);
    }
         
    //mesure
    *translate([0,0,-outerheight/2+dcolofs/2]){         
        cube([2,2,dcolofs],center=true);
    }
    //translate([0,0,-outerheight/2+lowcuth/2])
    
}
