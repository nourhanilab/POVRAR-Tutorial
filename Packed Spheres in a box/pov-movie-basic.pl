#!/usr/bin/perl 
# Renders a POV-Ray movie of a rotating cylinder of particles and their Voronoi
# cells, with particles and cells being slowly introduced.

foreach $g (0..720) {
	
	# Select the number of particles to render. In this case, it is set to
	# four times the current frame number.
	$p=$g*4;

	#Select the angle of rotation
	$rot=$g/2;

	# Assemble a temporary POV-Ray scene file, beginning by outputting the
	# first part of the header file until the include command is reached 
	open T,">rtemp.pov";
	open A,"cylinder.pov";
	while (<A>) {
		last if m/^#include "cylinder_p.pov"$/;
		print T;
	}

	# Output the particles, switching the output on and off dependning
	# on the positions of the "id" comments in the file
	$o=1;
	open B,"cylinder_p.pov";
	while (<B>) {
		if (m/id (\d*)/) {
			$o=$1<$p?1:0;next;
		}
		print T if $o;
	}
	close B;
	
	# Search for the next include position in the header file, and also set
	# the first occurrence of the cylinder rotation
	while (<A>) {
		s/ROT/$rot/g;
		last if m/^#include "cylinder_v.pov"$/;
		print T;
	}
	
	# Output the Voronoi cells, switching the output on and off depending
	# on the "id" comments in the file
	$o=1;
	open B,"cylinder_v.pov";
	while (<B>) {
		if (m/cell (\d*)/) {
			$o=$1<$p?1:0;next;
		}
		print T if $o;
	}
	close B;
	
	# Output the rest of the header file
	while (<A>) {
		s/ROT/$rot/g;
		print T;
	}
	close T;

	# Render the POV file. The first four options control the file output
	# name and the antialiasing. The "+SU" option causes POV-Ray to split
	# up unions of objects, which can often result in better performance.
	# The "-J" option removes the random jitter effect that is used in the
	# antialiasing procedure. For movies, this is generally preferable
	# since it stops a sequence of frames appearing slightly noisy. The
	# "-D" option ensures that POV does not display the progess of the
	# rendering.
	print "Rendering frame $f\n";
	$g=$f+1000;
	system "povray +Ofr_$g.png +W600 +H600 +A0.1 +SU -J -D rtemp.pov";
	
	# Update the frame counter
	$f++;
}
