##Programs needed

List compiled by Jim Baldwin-Brown at UCI:

Hi Kevin,

Here's a list of all the necessary programs (I think).  Let me know if it
looks like I missed anything important.  I'm collecting together the
scripts that I use now, so I'll send that to you probably tomorrow.

Programs needed:

MUMmer 3.23 (latest version
http://mummer.sourceforge.net/

Python 2.7.2 (2.7.6 is probably ok.  Not python 3.*)
https://www.python.org/download/

Celera WGS 7.0 (later versions probably ok)
http://sourceforge.net/apps/mediawiki/wgs-assembler/index.php?title=Main_Page

Quake 0.3 (latest version)
http://www.cbcb.umd.edu/software/quake/

EA-utils.1.1.2-537 (later versions fine)
note: EA-utils is used for joining paired end reads into pontigs.  It is
not required with a normal Illumina library.
http://code.google.com/p/ea-utils/

ECtools (download master branch)
https://github.com/jgurtowski/ectools

-Jim

##Obtaining and compiling

###Mummer

Notes: this seems to prefer newer GCC versions.  Confirmed versions:
<ol>
<li>4.8.2</li>
<li>4.7.2</li>
</ol>

Failed versions:
<ol>
<li>4.6.3</li>
</ol>

```shell
wget http://sourceforge.net/projects/mummer/files/mummer/3.23/MUMmer3.23.tar.gz
tar xzf MUMmer3.23.tar.gz 
cd MUMmer3.23
```

Result of compilation is a single binary called "mummer".  If you have admin permissions:

```
sudo cp mummer /usr/local/lib
```

If not:

```
#make a $HOME/bin directory:
mkdir ~/bin
#copy mummer to it:
cp mummer ~/bin
```


###Celera WGS assembler

THIS ONE IS A PAIN TO COMPILE--WORKING ON IT.

NEEDS FIXING / MORE INFO FROM JIM AND/OR ANDY

To get version 7.0 source code, which compiles fine with gcc 4.8.2:

```
wget http://sourceforge.net/projects/wgs-assembler/files/wgs-assembler/wgs-7.0/wgs-7.0.tar.bz2
tar xjf wgs-7.0.tar.bz2
cd wgs-7.0/kmer
make
```

###Quake

Compile fine with gcc 4.8.2

Note: this needs [boost](www.boost.org).  For UCI HPC users, execute this command before compiling:

```
module load boost/1.53.0
```

Note: the Makefile is suboptimal.

This line in particular is a problem:

```
CFLAGS=-O3 -fopenmp -I/opt/local/var/macports/software/boost/1.46.1_0/opt/local/include -I.
```

On HPC, I edited it to read:

```
CFLAGS=-O3 -fopenmp -I/opt/local/var/macports/software/boost/1.46.1_0/opt/local/include -I. $(CPPFLAGS)
```

Other users may need to modify it to point to their boost installation.


```shell
wget http://www.cbcb.umd.edu/software/quake/downloads/quake-0.3.5.tar.gz
tar xzf quake-0.3.5.tar.gz
cd Quake/src
make
```

The result of compilation is lots of binary files in Quake/bin.  Put them somewhere in your user's $PATH.

###EA utils

Note: depends on the GNU Scientific Library, aka [GSL](http://www.gnu.org/software/gsl/).

Compiles fine with gcc 4.8.2

```
wget https://ea-utils.googlecode.com/files/ea-utils.1.1.2-537.tar.gz
cd ea-utils.1.1.2-537
make
```

Output is lots of executables.  Put them somewhere in your user's $PATH.

###EC Tools

```
git clone https://github.com/jgurtowski/ectools.git
```

Then it looks like you follow instructios in ectools/README