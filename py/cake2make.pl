##!/usr/local/bin/perl 
eval "exec perl -S  $0 $*"
                         if $running_under_some_shell;

# Convert a cakefile to a makefile
#
# Joel Schroeder: Summer 1995

# Below is a list of what this file converts:
# 
# change #define'd variables to ${} variables where they occur
# change the #defines to = assignments
# remove '#include <SEP...>' and '#include "SEP..."'
# add 'include ${SEPINC}/SEP.top' near the top
# add 'include ${SEPINC}/SEP.bottom' near the bottom
# change '#include <NAME>' to 'include ${SEPINC}/NAME'
# change '#include "NAME"' to 'include NAME'
# change NAME! and NAME& targets to NAME
# with the -p switch (WARNING, this is partly-implemented):
# 	change NAME! targets to .PRECIOUS targets
# 	change NAME& targets to .PHONY targets
# 	The precious and phony targets are put into two lines at
#	the end of the converted file.
# Convert the first $ in any line to # (i.e. change the comment symbol)
# Remove lines with "FLINK"
# Replace % with $* in all lines which start with \t
# Replace cake with make and Cake with Make
# Change FIGDIR to ${RESDIR}
# If the translated line is of the form ${VAR} = ..., change it to VAR = ...
# Change lines beginning with eight spaces to lines beginning with tabs
# Change #define SEMINAR to SEMINAR = yes
#
# CAVEATS:
#	-- According to the SEP make rules, all user defined variables should
#	   be lower case.  So, an upper case variable in the cakefile (which
#	   is not intended to override a rule variable) needs to be changed to
#	   lower case on translation.
#	-- Lines with FLINKs are removed (this shouldn't be a problem)
#	   These FLINKs generally occur as follows:
#	      #define obj o1.o o2.o o3.o prog.o
#	      prog.x : obj
#		FLINK(obj,prog);	# or something similar
#	   Thus, the make version would be (after some translation by hand!):
#	      prog.x : o1.o o2.o o3.o
#	   The variable obj is unnecessary as is the dependency on prog.o
#	-- Comments are not translated as perhaps they should be.
#	   Specifically, if in the cakefile, there is a useful block which
#	   has been commented out, it is not safe to simply comment it back in
#	   in the makefile.
#	-- All comand lines (under rules) should have a tab as their first
#	   character.  This is required in gmake, but is unfortunately not in
#	   cake.  Thus, any line which begins with eight spaces is changed so
#	   that the spaces become tabs.  This will probably not cause problems.
#	-- If there is a dependency on the cakefile, when it is translated to
#	   the makefile, if there is no makefile target, the behavior may not
#	   be what is desired.
#	-- Conditional dependencies (e.g. if cando file) are not transferrable
#	   to gmake, and so must be hand translated.
#	-- Executables need the .x extension for the implicit compilation
#	   rules to work in make, whereas this was not necessary in cake.
#	   Hence, there may need to be some hand editing in this regard.
#	-- Since multiple pattern rules (i.e. %1, %2, etc.) are not supported
#	   by make, they must be converted by hand.
#	-- [[sub ... ]] should be hand converted (probably to ${patsubst ... })
#	-- Using variables which are environment variables is bad.  For
#	   example: in cake it is okay to #define PATH, since this doesn't
#	   affect the environment variable PATH, whereas this becomes a problem
#	   in make.
#	-- The implicit linking rule is tricky.  If explicit dependencies are
#	   needed (in addition to the implicit ones in SEP.prog.rules), the
#	   executable should end in .x, and there needs to exist one of the
#	   implicit dependencies (i.e. a file with the same name, but
#	   different suffix [e.g. main.o or main.c]).  Otherwise, the implicit
#	   rule (i.e. the one with the link command) will be ignored, and
#	   nothing will happen.
#	-- Make is more verbose than cake.  In particular, if a unix command
#	   returns an error value, make will issue an error message (and
#	   ignore the error).  For example, if grep is executed, but no match
#	   is found, make issues an error message.
#	-- Although we change #define SEMINAR to SEMINAR = yes, there may be
#	   similar variable changes necessary (because the rules were changed
#	   from cake to make).
#

$usage = "Usage: $0 [-p] filename\n";
$selfdoc = "\nConvert a cakefile to a makefile (in accord with the SEP rules).
Caution: additional hand translation may be necessary -- see
the comments in the source code ($0) for details.
Also, result (formerly figure) files with .save suffixes should be renamed
or copied without the suffix.  (This applies to non-reproducible results).
\nTypical usage: $0 cakefile > makefile\n";

if( $#ARGV < 0 ||$#ARGV > 1 ) {
  print $usage;
  die $selfdoc;
  }

  # check if the -p switch was used
$p_flag = 0;
foreach $arg (@ARGV) {
    if ($arg eq "-p") { $p_flag = 1; }
}

foreach $file (@ARGV) {

    open(FILE, $file) || warn "Can't open $file: $!\n";
	# initialize assumed tokens (defined in included files)
    %curr_def_tokens = (
	'BINDIR',	'${BINDIR}',
	'OFF${',	'${O',
	'CLASS${',	'${O',
	'CLASSDATA',	'${CLASSDATA}',
	'TUBEARGS',	'UTUBEFLAGS',
	'SEPLIB',	'${SEPLIB}',
	'FIGDIR',	'${RESDIR}',
	'VPLOTLIBF',	'VPLOTLIB',
	'VPLOTLIB',	'${VPLOTLIB}',
	'BEILIB',	'${BEILIB}',
	'IEILIB',	'${IEILIB}',
	'PVILIB',	'${PVILIB}',
	'TDFLIB',	'${TDFLIB}',
	'USRLIBS',	'UF77LIBS',
	'RM_CMD',	'${RM}',
	'Q2',		'../../Data'
    );

    print "include \${SEPINC}/SEP.top\n";

    while (<FILE>) {
	@phony_targets = ();
	@precious_targets = ();
	  # change the comment symbol
	if (/([^\$]*)\$(.*\n*)$/) {
	    $_ = "$1#$2";
	}
	  # change all previously declared #define'd tokens in this line
	  # to their gmake equivalent, ${NAME}
	foreach $token (sort keys(%curr_def_tokens)) {
	    s/$token/$curr_def_tokens{$token}/g;
	}
	  # replace C/cake with M/make
	s/Cake/Make/g;
	s/cake/make/g;
	  # check the line for a #define
        if (/^#\s*define\s+(\S*)(.*\n?)$/) {
	    $_ = "$1 =$2";
	    $curr_def_tokens{$1} = '$'."{$1}";
	}
	  # remove #include SEP...
	if (/^#\s*include\s+[<"]SEP.*[>"].*/) {
	    $_ = "";
	}
	  # convert for #include <NAME>
	if (/^#\s*include\s+<(.*)>.*(\n?)$/) {
	    $_ = "include ".'$'."{SEPINC}/$1$2";
	}
	  # check for \t at beginning, and change % -> $*
	elsif (/^\t.*/) {
	    s/%/\$*/g;
	}
	  # check for #include "NAME"
	if (/^#\s*include\s+"(.*)".*(\n?)$/) {
	    $_ = "include $1$2";
	}
	elsif (/(.*)FLINK(.*\n?)$/) {
	    $_ = "";
	}
	elsif ($p_flag) {
	      # check for phony targets
	    while (/((\s*)|(.+\s+))(\S+)&(.*):(.*\n*)$/) {
		$_ = "$1$4$5:$6";
		unshift(@phony_targets,$4);
	    }
	      # check for precious targets
	    while (/((\s*)|(.+\s+))(\S+)!(.*):(.*\n*)$/) {
		$_ = "$1$4$5:$6";
		unshift(@precious_targets,$4);	    
	    }
	}
	else {
	      # check for phony targets
	    while (/(.*)&(.*):(.*\n*)$/) {
		$_ = "$1$2:$3";
	    }
	      # check for precious targets
	    while (/(.*)!(.*):(.*\n*)$/) {
		$_ = "$1$2:$3";
	    }
	}
		# Convert FIGLIST into RESULTSER, RESULTSCR, RESULTSNR
		# Assume the figures are in ../Fig
		# Use the .warning and .save suffixes to determine which list
		# to put each figure in.
	$fd = "../Fig/";
	if (/\s*FIGLIST\s+=/) {	# separate FIGLIST into RESULTSER, etc.
	    s/\s*FIGLIST\s+=//;	# leave only the figure names
	    @nr_res = ""; @er_res = ""; @cr_res = "";
	    foreach $figname (split) {
		if ((-e $fd.$figname.".ps.save") || (-e $fd.$figname.".v.save")) {
		    push(@nr_res, $figname);
		}
	    	elsif (-e $fd.$figname.".warning") {
		    push(@cr_res, $figname);
		}
		else {
		    push(@er_res, $figname);
		}
	    }
	    $_ = "";
	    $nrfig = join(' ',@nr_res);
	    $erfig = join(' ',@er_res);
	    $crfig = join(' ',@cr_res);
	    
	    print "RESULTSNR =".$nrfig."\n" if ($nrfig ne "");
	    print "RESULTSCR =".$crfig."\n" if ($crfig ne "");
	    print "RESULTSER =".$erfig."\n" if ($erfig ne "");
	}
	  # change '${VAR} = ...' to 'VAR = ...' if necessary
	if (/^\s*\${(.+)}\s*=(.*\n?)$/) {
	    $_ = "$1 =$2";
	}
	  # change lines beginning with 8 spaces to lines beginning with a tab
	if (/^        (.*\n?)$/) {
	    $_ = "\t$1";
	}
	  # change "SEMINAR =" to "SEMINAR = yes"
	if (/^\s*SEMINAR\s*=\s*\n?$/) {
	    s/=/= yes/;
	}
	print $_;
    } # end while
    if ($p_flag) {
    	  # add PHONY target line at end
    	print "\n.PHONY : @phony_targets\n";
    	  # add PRECIOUS target line at end
    	print "\n.PRECIOUS : @precious_targets\n";
    }

    print "include \${SEPINC}/SEP.bottom\n";

} # end foreach
