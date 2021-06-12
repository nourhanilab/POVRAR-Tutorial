# The packing of spheres in a box 
(voronoi tessellation of space)

run `pov-movie-basic.pl` for the itterations to build and rotate the box of spheres. 

Then, run

`ffmpeg -r 30 -i fr_1%03d.png -c:v libx264 -vf fps=25 -pix_fmt yuv420p PackedSpheres.mp4`

to make a video out of the frames.

