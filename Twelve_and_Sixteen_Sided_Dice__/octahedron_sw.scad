dihedral = 109.47122;
dihedraldec=0.47122;
font = "Wingdings 2";
letter_size = 6;


module box(size) {
    cube([2*size, 2*size, size], center = true); 
}

module octahedron(size) {
 
      n = 3;
      intersection(){
            box(size);
            intersection_for(i=[1:n])  { 
                rotate([dihedral, 0, 360 /n * i])  box(size); 
           }
      }
}

module decorate(char,font,x3,y3,ang){
  linear_extrude(height = letter_height)
   translate([x3,y3,0])
     rotate([0,0,ang])
   {
       text(char,size = letter_size, font = font, halign = "center", valigh = "baseline", $fn = 16);
   }

}

letter_height = 0.3;

module make_triumph(){
    t="a";
    linear_extrude(height = letter_height) text(t,size = letter_size, font = "EotE Symbol", halign = "center", valigh = "baseline", $fn = 16);
}

module make_doubletriumph(){
    tri="a";
    xo=2.6;
    fo=0.6;
    rotate([0,0,dihedral+10]){
         translate([0,xo,0]) linear_extrude(height = letter_height)   text(tri,size = letter_size*fo, font = "EotE Symbol", halign = "center", valigh = "baseline", $fn = 16);
        translate([0,-xo,0]) linear_extrude(height = letter_height)   text(tri,size = letter_size*fo, font = "EotE Symbol", halign = "center", valigh = "baseline", $fn = 16);
    }
}


module make_star(){
    star="s";
    linear_extrude(height = letter_height)   text(star,size = letter_size, font = "EotE Symbol", halign = "center", valigh = "baseline", $fn = 16);
}

module make_starandtriumph(){
    tri="a";
    star="s";
    xo=2.6;
    fo=0.6;    
    xl=2.5;
    rotate([0,0,dihedral+10]){
         translate([xl,-xo*0.3,0]) linear_extrude(height = letter_height)   text(tri,size = letter_size*fo, font = "EotE Symbol", halign = "center", valigh = "baseline", $fn = 16);
        translate([xl,-xo*2.3,0]) linear_extrude(height = letter_height)   text(star,size = letter_size*fo, font = "EotE Symbol", halign = "center", valigh = "baseline", $fn = 16);
    }
}


module make_doublestar(){
    star="s";
    xo=2.5;
    fo=0.6;
    rotate([0,0,45*0.7]){
        translate([-xo-1,-xo,0]) linear_extrude(height = letter_height)   text(star,size = letter_size*fo, font = "EotE Symbol", halign = "center", valigh = "baseline", $fn = 16);
        translate([+xo-1,-xo,0]) linear_extrude(height = letter_height)   text(star,size = letter_size*fo, font = "EotE Symbol", halign = "center", valigh = "baseline", $fn = 16);
    }
}




difference(){
    color ("green") scale(0.75) octahedron(20);
    /*triumph top*/
    translate([0,-2,7.501-letter_height]) make_triumph();
    /*triumph bottom*/
    translate([0,2,-7.501])  mirror([0,1,0]) make_triumph();
    /*star front*/
    translate([0,6.19-letter_height,4.999])  
        rotate([-dihedral+40-dihedraldec*2.5,0,0]) make_star();
    /*star back*/
    translate([0,-7.69-letter_height,0])
        rotate([-dihedral+40-dihedraldec*2.5,0,0]) make_star();
    /*double star left*/
   translate([-6,6.19-9.68-letter_height,1.599])  
        rotate([-dihedral+40-dihedraldec*2.5,0,dihedral+10+dihedraldec]) make_doublestar();
    
   
   /*double d.triumph front right*/
   rotate([0,0,dihedral+dihedraldec+10])
   translate([1.6,-6.44-letter_height,-3.5])
        rotate([-dihedral+40-dihedraldec*2.5,0,0]) make_doubletriumph();
        
   /*triump and star front left*/
   rotate([0,0,-dihedral+dihedraldec-10-dihedraldec])
   translate([0,-7.69-letter_height,0])
        rotate([-dihedral+40-dihedraldec*2.6,0,0]) make_starandtriumph();        
}


//decorate("Ø","Wingdings 2",-20,0,0);
//decorate("\u150","Wingdings",20,-10,0);
//decorate(t,"Wingdings",20,0,180);

//translate([20,5,0]) mirror([0,1,0]) text("a",size = letter_size, font = "WingDings", halign = "center", valigh = "baseline", $fn = 16);
