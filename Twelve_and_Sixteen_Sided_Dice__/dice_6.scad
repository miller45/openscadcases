/*

A pseudo six sided dice

Back to back pyramids make "fair" dice see

http://loki3.com/poly/fair-dice.html

for more information.

The dice consists of two six sided
pyramids back to back - each labeled
with the numerals from 1 through 6


PCM  October, 2015

*/


r10 = 12.5;
rz = 12.5;



font = "Liberation Sans";
letter_size = 6;
letter_height = 2;
lsx = 5;

scale(1.75)
difference()
{

polyhedron(vertices,faces);

    decorate_6();
}



vertices  =[

           [ cos(0)*r10,sin(0)*r10,0],
           [ cos(360/6)*r10,sin(360/6)*r10,0],
           [ cos(2*360/6)*r10,sin(2*360/6)*r10,0],
           [ cos(3*360/6)*r10,sin(3*360/6)*r10,0],
           [ cos(4*360/6)*r10,sin(4*360/6)*r10,0],
           [ cos(5*360/6)*r10,sin(5*360/6)*r10,0],
           [0,0,r10],[0,0,-r10],

             ];
     faces = [
      [1,0,6],[2,1,6],[3,2,6],[4,3,6],[5,4,6],
      [0,5,6],[0,1,7],[1,2,7],[2,3,7],[3,4,7],
      [4,5,7],[5,0,7],

       ];



  module decorate_6()
{

  decorate (-1,   0.57735,  1,"4",-.4,6,180);
  decorate ( -1,  0.57735,  -1,"3",-.4,-6,0);
  decorate ( -1,  -0.57735,  1,"2",-.4,6,180);
  decorate ( -1,  -0.57735,  -1,"1",-.4,-6,0);
  decorate ( 0,  -1.15470,  -1,"6",-.4,-6,0);
  decorate (  0, -1.15470,  1,"3",-.4,6,180);
  decorate ( 0,   1.15470,   -1,"5",-.4,-6,0);
  decorate (  1,   0.57735,   -1,"4",-.4,-6,0);
  decorate (  1,  -0.57735,   -1,"2",.4,-6,0);
  decorate (  1,   -0.57735,   1,"6",-.4,6,180);
  decorate (  1,    0.57735,   1,"5",-.4,6,180);
  decorate (  0,  1.15470,   1,"1",-.4,6,180);
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


