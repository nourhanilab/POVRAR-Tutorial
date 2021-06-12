// POV-Ray 3.6 Scene File "spline_fly1.pov"
// created by Friedrich A. Lohmueller, 2003 
// Demonstrates the Spline_Trans macro of Rune S. Johansen
//------------------------------------------------------------------------
#version 3.6;
global_settings {  assumed_gamma 1.0 }
//------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"

#include "math.inc"
#include "transforms.inc"

#include "shapes.inc"
#include "golds.inc"
#include "metals.inc"


//------------------------------------------------------------------------
#declare Camera_1 = camera { 
						     angle 45
                             location  <7.0 , 10.0 ,-10.0>
                             right     x*image_width/image_height
                             look_at   <0.8 , 2.5 , 0.0>
                           }

#declare Camera_2 = camera { 
						     //angle 45
                             location  <0.0 , 65.0 ,0.0>
                             right     x*image_width/image_height
                             look_at   <0.0 , 0.0 , 0.0>
                           }
                
#declare Camera_3 = camera { 
						     //angle 45
                             location  <-0 , 50.0 ,0.0>
                             right     x*image_width/image_height
                             look_at   <0.0 , 0.0 , 0.0>
                           }




//------------------------------------------------------------------------
// sun -------------------------------------------------------------------
light_source{<-100,2500,-1000> color White}
// sky -------------------------------------------------------------------
sky_sphere{ pigment{ gradient <0,1,0>
                     color_map{ [0   color rgb<1,1,1>         ]//White
                                [0.4 color rgb<0.14,0.14,0.56>]//~Navy
                                [0.6 color rgb<0.14,0.14,0.56>]//~Navy
                                [1.0 color rgb<1,1,1>         ]//White
                              }
                     scale 2 }
           } // end of sky_sphere 
//------------------------------------------------------------------------




// ground -----------------------------------------------------------------
//---------------------------------<<< settings of squered plane dimensions
#declare RasterScale = 1.0;
#declare RasterHalfLine  = 0.025;  
#declare RasterHalfLineZ = 0.025; 
//-------------------------------------------------------------------------
#macro Raster(RScale, HLine) 
       pigment{ gradient x scale RScale
                color_map{[0.000   color rgbt<0,0,0,0>]
                          [0+HLine color rgbt<0,0,0,0>]
                          [0+HLine color rgbt<1,1,1,1>]
                          [1-HLine color rgbt<1,1,1,1>]
                          [1-HLine color rgbt<0,0,0,0>]
                          [1.000   color rgbt<0,0,0,0>]} }
       finish { ambient 0.15 diffuse 0.85}
 #end// of Raster(RScale, HLine)-macro    
//-------------------------------------------------------------------------
    

plane { <0,1,0>, 0    // plane with layered textures
        texture { pigment{color White*1.1}
                  finish {ambient 0.45 diffuse 0.85}}
        texture { Raster(RasterScale,RasterHalfLine ) rotate<0,0,0> }
        texture { Raster(RasterScale,RasterHalfLineZ) rotate<0,90,0>}
        rotate<0,0,0>
      }
//------------------------------------------------ end of squered plane XZ

//--------------------------------------------------------------------------
//---------------------------   scenery objects  ---------------------------
//--------------------------------------------------------------------------



//-------------------------------------------
#macro nanomotor (Point, LengthScale, Angle) 
union{

  // ---------------------------------------
  object{
   //Round_Cylinder(A,B,Radius,EdgeRadius,Merge)
   Round_Cylinder(<0,0,-0.2>,<0,0,1>,0.40,0.10,0)
   texture{T_Gold_1A } // end of texture
   no_shadow
   scale<1,1,1>
   rotate<0,0,0>
   translate<0,0,0>
  } //---------------------------------------

  // ---------------------------------------
  object{
   //Round_Cylinder(A,B,Radius,EdgeRadius,Merge)
   Round_Cylinder(<0,0,-1>,<0,0,0.1>,0.401,0.10,0)
   texture {finish {Metal} pigment{White}}
   no_shadow
   scale<1,1,1>
   rotate<0,0,0>
   translate<0,0,0>
  } //---------------------------------------



scale <0 ,0 , LengthScale>   
rotate<0,90,0>
rotate<0,Angle,0>
translate Point
} #end //----------------------------------------------------------


#declare dist = 10;
#declare lscl = 15;
#declare pscl = 10;
#declare originpoint = <400, 0 , 300>;


#declare ptcl = array[28];// start with zero!
#declare lngth = array[28];// start with zero!
#declare ornt = array[28];// start with zero!




#declare ptcl[0] = <313.515, dist, 274.722>;
#declare lngth[0] = 25.077;
#declare ornt[0] = -11.767;

#declare ptcl[1] = <78.5506, dist, 341.037>;
#declare lngth[1] = 21.9267;
#declare ornt[1] = 33.6908;

#declare ptcl[2] = <144.432, dist, 490.536>;
#declare lngth[2] = 17.2308;
#declare ornt[2] = -61.9299;

#declare ptcl[3] = <188.015, dist, 570.607>;
#declare lngth[3] = 14.5116;
#declare ornt[3] = 65.2257;

#declare ptcl[4] = <278.728, dist, 514.354>;
#declare lngth[4] = 18.0458;
#declare ornt[4] = -51.839;

#declare ptcl[5] = <308.628, dist, 511.821>;
#declare lngth[5] = 22.776;
#declare ornt[5] = 57.725;

#declare ptcl[6] = <449.513, dist, 553.377>;
#declare lngth[6] = 25.1758;
#declare ornt[6] = 49.8981;

#declare ptcl[7] = <596.491, dist, 510.301>;
#declare lngth[7] = 16.3399;
#declare ornt[7] = -82.9694;

#declare ptcl[8] = <713.037, dist, 547.295>;
#declare lngth[8] = 22.7768;
#declare ornt[8] = 57.7264;

#declare ptcl[9] = <702.395, dist, 570.101>;
#declare lngth[9] = 17.7011;
#declare ornt[9] = -66.3704;
// 1
#declare ptcl[10] = <369.948, dist, 371.408>;
#declare lngth[10] = 17.7306;
#declare ornt[10] = -30.9626;
//2
#declare ptcl[11] = <369.442, dist, 331.037>;
#declare lngth[11] = 15.4722;
#declare ornt[11] = 58.3923;

#declare ptcl[12] = <457.621, dist, 362.828>;
#declare lngth[12] = 15.8649;
#declare ornt[12] = 26.5651;

#declare ptcl[13] = <572.66, dist, 367.389>;
#declare lngth[13] = 17.231;
#declare ornt[13] = 0.;

#declare ptcl[14] = <745.978, dist, 332.421>;
#declare lngth[14] = 18.6336;
#declare ornt[14] = -67.619;

#declare ptcl[15] = <289.371, dist, 247.283>;
#declare lngth[15] = 16.2486;
#declare ornt[15] = 3.57435;

#declare ptcl[16] = <113.012, dist, 107.412>;
#declare lngth[16] = 16.9905;
#declare ornt[16] = -17.3546;

#declare ptcl[17] = <194.603, dist, 55.7203>;
#declare lngth[17] = 18.8529;
#declare ornt[17] = -36.2544;

#declare ptcl[18] = <226.023, dist, 13.1509>;
#declare lngth[18] = 17.2601;
#declare ornt[18] = -40.237;

#declare ptcl[19] = <245.281, dist, 102.851>;
#declare lngth[19] = 19.4695;
#declare ornt[19] = 38.6605;

#declare ptcl[20] = <474.851, dist, 60.2813>;
#declare lngth[20] = 23.1128;
#declare ornt[20] = -52.1246;

#declare ptcl[21] = <493.602, dist, 115.52>;
#declare lngth[21] = 20.5225;
#declare ornt[21] = -57.0943;

#declare ptcl[22] = <480.933, dist, 186.976>;
#declare lngth[22] = 21.5487;
#declare ornt[22] = 41.1862;

#declare ptcl[23] = <549.854, dist, 128.697>;
#declare lngth[23] = 20.7963;
#declare ornt[23] = -46.9739;

#declare ptcl[24] = <629.925, dist, 100.317>;
#declare lngth[24] = 21.7626;
#declare ornt[24] = 62.241;

#declare ptcl[25] = <629.925, dist, 100.317>;
#declare lngth[25] = 21.7626;
#declare ornt[25] = 62.241;

#declare ptcl[26] = <674.455, dist, 59.5016>;
#declare lngth[26] = 19.148;
#declare ornt[26] = 12.5286;
 
#declare ptcl[27] = <0, dist, 0>;
#declare lngth[27] = 19.148;
#declare ornt[27] = 0; 
 

#declare Nr = 0;     // start
#declare EndNr = 27; // end
#while (Nr< EndNr) 

object{nanomotor((ptcl[Nr] - originpoint)/pscl, lngth[Nr]/lscl, - ornt[Nr])}

#declare Nr = Nr + 1;  // next Nr
#end // --------------- end of loop   -----------------------end














#declare P = array[9];// start with zero!

#declare P[0] = <0, 80, 0>; 
#declare P[1] = <0, 65, 0>;
#declare P[2] = <5.5, 35,  1>;
#declare P[3] = <12, 23, 5>;
#declare P[4] = <2, 11, 13>;
#declare P[5] = <-6., 3, 6>;
#declare P[6] = <-7.6, 1.8, 1>;
#declare P[7] = <-7.5, 1.5, -1>;
#declare P[8] = <-4, 1.5, -0>;


#declare Spline_1 =
  spline {
    natural_spline
   -0.050, P[0],
    0.000, P[1], // start
    0.150, P[2], 
    0.200, P[3], 
    0.370, P[4], 
    0.450, P[5],
    0.500, P[6],  
    0.590, P[7],
    0.610, P[8],// end
  }


#declare r = 0.1;






#declare Camera_4 = camera { 
						     //angle 45
                             location Spline_1(clock*0.500)
                             right     x*image_width/image_height
                             #if (clock*0.500 < 0.480) 
                               look_at   Spline_1(clock*0.500 + 0.005)
                             #else
                               look_at <313.515 - 400, dist, 274.722 - 300> / pscl
                             #end
                           }
                
camera{Camera_4}
