#version 3.6;

#include "colors.inc"
#include "metals.inc"
#include "textures.inc"

camera {
	location <20,20,-50>
	right 0.4*x*image_width/image_height
	up 0.4*y
	look_at <0,.5,0>
}

background{rgb 1}

light_source{<-8,30,-20> color rgb <0.77,0.75,0.75>}
light_source{<20,5,-15> color rgb <0.38,0.40,0.40>}

#declare r=0.06;
#declare s=0.5;

union{
#include "cylinder_p.pov"
	rotate <0,ROT,0>
//	pigment{rgb <1,0.95,0.5>} 
//	finish{reflection 0.1 specular 0.3 ambient 0.42}
//	pigment{rgb<0.8,0.7,0.2>}
//	finish{ambient 0.3 specular 0.2 reflection 0.4}
//       texture{T_Silver_3C}
 //     texture{T_Gold_3C}
	pigment{rgb <0.92,0.65,1>} finish{reflection 0.17 specular 0.3 ambient 0.42}
//	pigment{rgb <0.2, 1,0.5>} finish{reflection 0.17 specular 0.3 ambient 0.42}
}

union{
#include "cylinder_v.pov"
	rotate <0,ROT,0>
//	pigment{rgb <0.5,0.8,1>} finish{specular 0.5 ambient 0.42}
//      texture{T_Gold_3C}
pigment{rgb <0.2, 1,0.5>} finish{reflection 0.17 specular 0.3 ambient 0.42}
//       pigment{rgb <0.1,0.15,0.4>}	finish{reflection 0.25 specular 0.4 ambient 0.6}
}
