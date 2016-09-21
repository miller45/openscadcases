/*

A pseudo eight sided dice

Back to back pyramids make "fair" dice see

http://loki3.com/poly/fair-dice.html

for more information.

The dice consists of two eight sided
pyramids back to back - each labeled
with the numerals from 1 through 8


PCM  October, 2015

*/





r10 = 12.5;

font = "Liberation Sans";
letter_size = 6;
letter_height = 2;
lsx = 5.5;


scale(1.75)
difference()
{

polyhedron(vertices,faces);

    decorate_16();
}



vertices  =[

           [ cos(0)*r10,sin(0)*r10,0],
           [ cos(360/8)*r10,sin(360/8)*r10,0],
           [ cos(2*360/8)*r10,sin(2*360/8)*r10,0],
           [ cos(3*360/8)*r10,sin(3*360/8)*r10,0],
           [ cos(4*360/8)*r10,sin(4*360/8)*r10,0],
           [ cos(5*360/8)*r10,sin(5*360/8)*r10,0],
           [ cos(6*360/8)*r10,sin(6*360/8)*r10,0],
           [ cos(7*360/8)*r10,sin(7*360/8)*r10,0],
           [0,0,r10],[0,0,-r10],

             ];
     faces = [
      [1,0,8],[2,1,8],[3,2,8],[4,3,8],[5,4,8],
      [6,5,8],[7,6,8],[0,7,8],[0,1,9],[1,2,9],
      [2,3,9],[3,4,9],[4,5,9],[5,6,9],[6,7,9],
      [7,0,9],

       ];


  module decorate_16()
{

  decorate (-0.41421,  -1.00000,   1.00000,"8",-.4,6,180);
  decorate ( -1.00000,  -0.41421,   1.00000,"1",-.4,6,180);
  decorate ( -0.41421,  -1.00000,  -1.0000,"8",-.4,-6,0);
  decorate (-1.00000,  -0.41421,  -1.0000,"5",-.4,-6,0);
  decorate ( -0.41421,   1.00000,  -1.0000,"4",-.4,-6,0);
  decorate ( 0.41421,   1.00000,  -1.00000,"3",-.4,-6,0);
  decorate ( -1.00000,   0.41421,  -1.00000,"2",-.4,-6,0);
  decorate (  1.00000,   0.41421,  -1.00000,"1",-.4,-6,0);
  decorate (   1.00000,  -0.41421,  -1.0000,"6",-.4,-6,0);
  decorate (  0.41421,  -1.00000,  -1.00000,"7",-.4,-6,0);
  decorate ( -1.00000,   0.41421,   1.00000,"6",-.4,6,180);
  decorate (  0.41421,  -1.00000,   1.00000,"5",-.4,6,180);
  decorate (    1.00000,  -0.41421,   1.00000,"4",.4,6,180);
  decorate (    0.41421,   1.00000,   1.00000,"3",-.4,6,180);
  decorate (  1.00000,   0.41421,   1.00000,"7",-.4,6,180);
  decorate (  -0.41421,   1.00000,   1.00000,"2",-.4,6,180);
  }



module decorate(x2,y2,z2,char,x3,y3,ang)
      {
translate(v=[lsx*x2,lsx*y2,lsx*z2])
rotate(a = [-acos(z2/sqrt(x2*x2+y2*y2+z2*z2)), 0, -atan2(x2, y2)])
  linear_extrude(height = letter_height)
   translate([x3,y3,0])
     rotate([0,0,ang])
   {text(char,size = letter_size, font = font, halign = "center",
     valigh = "baseline", $fn = 16);}

   }


