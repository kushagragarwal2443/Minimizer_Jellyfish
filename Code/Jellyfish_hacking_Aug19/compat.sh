if [ -z "$nCPUs" ]; then
    nCPUs=$(grep -c '^processor' /proc/cpuinfo 2>/dev/null || sysctl -n hw.ncpu)
fi
pref=$(basename $0 .sh)
DIR=../bin
JF="$DIR/jellyfish"
[ -n "$VALGRIND" ] && JF="valgrind $JF"
SRCDIR=/home/kushagra/Documents/IISc_Internship/Jellyfish/Code/Jellyfish_hacking_Aug19
BUILDDIR=/home/kushagra/Documents/IISc_Internship/Jellyfish/Code/Jellyfish_hacking_Aug19

check () {
    cut -d\  -f 2 $1 | xargs md5sum | sed 's/ \*/ /' | sort -k2,2 | diff -w $DIFFFLAGS $1 -
}

ENABLE_RUBY_BINDING=""
RUBY=""
ENABLE_PYTHON_BINDING=""
PYTHON=""
ENABLE_PERL_BINDING=""
PERL=""
SAMTOOLS="/usr/bin/samtools"
UNIX2DOS=""

if [ -n "$DEBUG" ]; then
    set -x;
    DIFFFLAGS="-y"
fi

set -e
