#!sh

command_exists () {
    type "$1" &> /dev/null ;
}

HAVEWGET=0

if command_exists wget
then
    HAVEWGET=1
fi

HAVECURL=0

if command_exists curl
then
    HAVECURL=1
fi

if [ $HAVEWGET -eq 0 ] && [ $HAVECURL -eq 0 ]
then
    echo "Error, neither curl nor wget are present in \$PATH.  Please install one of these"
    exit 10
fi

if [ $HAVEWGET -eq 1 ]
    then
    #mummer
    wget http://sourceforge.net/projects/mummer/files/mummer/3.23/MUMmer3.23.tar.gz
    #WGET 7.0
    wget http://sourceforge.net/projects/wgs-assembler/files/wgs-assembler/wgs-7.0/wgs-7.0.tar.bz2
    #quake 3.6
    wget http://www.cbcb.umd.edu/software/quake/downloads/quake-0.3.5.tar.gz
    #EA Utils
    wget https://ea-utils.googlecode.com/files/ea-utils.1.1.2-537.tar.gz
else
    echo "no wget"
fi

#EC Tools
git clone https://github.com/jgurtowski/ectools.git