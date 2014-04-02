#Intro
Notes on handling PACbio data collected by Casey Bergman in collab with PACbio and several others.

It appears that scripts related to how the assembly was carried may not be available?

##Relevant links
https://github.com/PacificBiosciences/DevNet/wiki/Drosophila-sequence-and-assembly

http://cbcb.umd.edu/software/PBcR/dmel.html

http://bergmanlab.smith.man.ac.uk/?p=2176

##Get the data

```
wget https://s3.amazonaws.com/datasets.pacb.com/2014/Drosophila/raw/Dro1_24NOV2013_398.tgz
wget https://s3.amazonaws.com/datasets.pacb.com/2014/Drosophila/raw/Dro2_25NOV2013_399.tgz
wget https://s3.amazonaws.com/datasets.pacb.com/2014/Drosophila/raw/Dro3_26NOV2013_400.tgz
wget https://s3.amazonaws.com/datasets.pacb.com/2014/Drosophila/raw/Dro4_28NOV2013_401.tgz
wget https://s3.amazonaws.com/datasets.pacb.com/2014/Drosophila/raw/Dro5_29NOV2013_402.tgz
wget https://s3.amazonaws.com/datasets.pacb.com/2014/Drosophila/raw/Dro6_1DEC2013_403.tgz
```

Note that they are also in [SRA](http://www.ncbi.nlm.nih.gov/sra/?term=SRP040522), but I currently don't know how to bulk-download data like these from there.  When you do download them, they come in as "file.sra", and contain the reads in fastq format, so you are not getting the raw data.  To pull the reads out of an SRA file, use SRA tools:

```
/data/users/krthornt/src/sra_sdk-2.3.4-2/linux/gcc/stat/x86_64/rel/bin/fastq-dump --split-files SRR1204689.sra
```

It is not clear to me what these warnings mean and if they are anything to be concerned about:
```
2014-04-01T19:01:22 fastq-dump.2.3.4 warn: too many reads 186 at spot id 8364, maximum 32 supported, skipped
2014-04-01T19:01:22 fastq-dump.2.3.4 warn: too many reads 32 at spot id 9194, truncated to 32
2014-04-01T19:01:23 fastq-dump.2.3.4 warn: too many reads 43 at spot id 14743, maximum 32 supported, skipped
2014-04-01T19:01:23 fastq-dump.2.3.4 warn: too many reads 37 at spot id 16079, maximum 32 supported, skipped
2014-04-01T19:01:25 fastq-dump.2.3.4 warn: too many reads 33 at spot id 29073, maximum 32 supported, skipped
2014-04-01T19:01:26 fastq-dump.2.3.4 warn: too many reads 49 at spot id 38390, maximum 32 supported, skipped
2014-04-01T19:01:28 fastq-dump.2.3.4 warn: too many reads 57 at spot id 51293, maximum 32 supported, skipped
2014-04-01T19:01:28 fastq-dump.2.3.4 warn: too many reads 32 at spot id 54089, truncated to 32
2014-04-01T19:01:28 fastq-dump.2.3.4 warn: too many reads 37 at spot id 58318, maximum 32 supported, skipped
2014-04-01T19:01:29 fastq-dump.2.3.4 warn: too many reads 32 at spot id 59377, truncated to 32
2014-04-01T19:01:31 fastq-dump.2.3.4 warn: too many reads 32 at spot id 77119, truncated to 32
2014-04-01T19:01:31 fastq-dump.2.3.4 warn: too many reads 39 at spot id 80040, maximum 32 supported, skipped
2014-04-01T19:01:31 fastq-dump.2.3.4 warn: too many reads 171 at spot id 81223, maximum 32 supported, skipped
2014-04-01T19:01:32 fastq-dump.2.3.4 warn: too many reads 95 at spot id 92406, maximum 32 supported, skipped
2014-04-01T19:01:33 fastq-dump.2.3.4 warn: too many reads 45 at spot id 98835, maximum 32 supported, skipped
2014-04-01T19:01:34 fastq-dump.2.3.4 warn: too many reads 32 at spot id 103152, truncated to 32
2014-04-01T19:01:35 fastq-dump.2.3.4 warn: too many reads 45 at spot id 110954, maximum 32 supported, skipped
2014-04-01T19:01:35 fastq-dump.2.3.4 warn: too many reads 33 at spot id 112527, maximum 32 supported, skipped
2014-04-01T19:01:35 fastq-dump.2.3.4 warn: too many reads 141 at spot id 113083, maximum 32 supported, skipped
2014-04-01T19:01:37 fastq-dump.2.3.4 warn: too many reads 49 at spot id 126224, maximum 32 supported, skipped
2014-04-01T19:01:37 fastq-dump.2.3.4 warn: too many reads 129 at spot id 126303, maximum 32 supported, skipped
2014-04-01T19:01:37 fastq-dump.2.3.4 warn: too many reads 47 at spot id 132259, maximum 32 supported, skipped
2014-04-01T19:01:38 fastq-dump.2.3.4 warn: too many reads 32 at spot id 133896, truncated to 32
2014-04-01T19:01:38 fastq-dump.2.3.4 warn: too many reads 37 at spot id 138740, maximum 32 supported, skipped
2014-04-01T19:01:38 fastq-dump.2.3.4 warn: too many reads 49 at spot id 140200, maximum 32 supported, skipped
2014-04-01T19:01:40 fastq-dump.2.3.4 warn: too many reads 32 at spot id 152284, truncated to 32
2014-04-01T19:01:40 fastq-dump.2.3.4 warn: too many reads 85 at spot id 162890, maximum 32 supported, skipped
Rejected 20 SPOTS because of to many READS
Read 163482 spots for SRR1204689.sra
Written 163450 spots for SRR1204689.sra
```

##Installing PACbio's tools as modules on UCI HPC

None of the below verified to actuall DO anything yet...

###pbcore

```shell
mkdir /data/apps/user_contributed_software/krthornt/pbcore
git clone https://github.com/PacificBiosciences/pbcore.git
cd pcbore
module load python/2.7.2
python setup.py install --root /data/apps/user_contributed_software/krthornt/pbcore
```

###HBAR-dtk
```
mkdir /data/apps/user_contributed_software/krthornt/hbar-dtk
git clone https://github.com/PacificBiosciences/HBAR-DTK
cd HBAR-DTK
module load python/2.7.2
python setup.py install --root  /data/apps/user_contributed_software/krthornt/hbar-dtk
```

###Falcon
```shell
mkdir /data/apps/user_contributed_software/krthornt/falcon
git clone https://github.com/PacificBiosciences/FALCON.git
module load python/2.7.2
cd FALCON
python setup.py install --root /data/apps/user_contributed_software/krthornt/falcon
```

###pbh5tools

```
mkdir /data/apps/user_contributed_software/krthornt/pbh5tools
git clone https://github.com/PacificBiosciences/pbh5tools
module load python/2.7.2
```

###WGS 8.1

This works on UCI HPC:

Note, this line in samtools/Makefile may need editing from:

```
$(CC) $(CFLAGS) -o $@ $(AOBJS) $(LDFLAGS) libbam.a -Lbcftools -lbcf $(LIBPATH) $(LIBCURSES) -lm -lz -lpthread 
```

to

```
$(CC) $(CFLAGS) -o $@ $(AOBJS) $(LDFLAGS) libbam.a -Lbcftools -lbcf $(LIBPATH) $(LIBCURSES) -lm -lz -lpthread -ltinfo 
```

on some systems.

Following that edit, to compile:

```
wget http://sourceforge.net/projects/wgs-assembler/files/wgs-assembler/wgs-8.1/wgs-8.1.tar.bz2
tar xjf wgs-8.1.tar.bz2
cd wgs-8.1
cd kmer && make install && cd ..
cd samtools && make && cd ..
cd src && make && cd ..
```

On my system, binaries are found in:

```
find . -name bin
./kmer/Linux-amd64/bin
./Linux-amd64/bin
[krthornt@hpc-login-1-2 wgs-8.1]$ ls ./kmer/Linux-amd64/bin
asmMerQC        existDB  mapMers-depth  maskMers  meryl           percentCovered  simple          testPositionBias  test-seqStream
compare-counts  mapMers  mask           mervin    mt19937ar-test  positionDB      test-merStream  test-seqCache
[krthornt@hpc-login-1-2 wgs-8.1]$ ls Linux-amd64/bin/
addReadsToUnitigs    cgw                     dumpCloneMiddles            frgs2clones                overlap_partition        sffToCA
analyzeBest          cgwDump                 dumpPBRLayoutStore          gatekeeper                 overlapStats             show-corrects
analyzePosMap        chimChe                 dumpSingletons              gatekeeperbench            overlapStore             splitUnitigs
analyzeScaffolds     chimera                 estimate-mer-threshold      gkpStoreCreate             overlapStoreBucketizer   terminator
asmOutputFasta       classifyMates           extendClearRanges           gkpStoreDumpFASTQ          overlapStoreBuild        TIGR
asmOutputStatistics  classifyMatesApply      extendClearRangesPartition  greedyFragmentTiling       overlapStoreIndexer      tigStore
asmToAGP.pl          classifyMatesPairwise   extractmessages             greedy_layout_to_IUM       overlapStoreSorter       tracearchiveToCA
bogart               computeCoverageStat     fastaToCA                   initialTrim                overmerry                tracedb-to-frg.pl
bogus                convert-fasta-to-v2.pl  fastqAnalyze                markUniqueUnique           pacBioToCA               trimFastqByQVWindow
bogusness            convertOverlap          fastqSample                 mercy                      remove_fragment          uidclient
buildPosMap          convertSamToCA          fastqSimulate               mergeqc.pl                 removeMateOverlap        unitigger
buildRefContigs      convertToPBCNS          fastqSimulate-sort          merTrim                    replaceUIDwithName       upgrade-v8-to-v9
buildUnitigs         correct-frags           fastqToCA                   merTrimApply               resolveSurrogates        upgrade-v9-to-v10
ca2ace.pl            correct-olaps           filterOverlap               meryl                      rewriteCache             utg2fasta
caqc_help.ini        correctPacBio           finalTrim                   metagenomics_ovl_analyses  runCA                    utgcns
caqc.pl              ctgcns                  fixUnitigs                  olap-from-seeds            runCA-dedupe             utgcnsfix
cat-corrects         deduplicate             fragmentDepth               outputLayout               runCA-overlapStoreBuild
cat-erates           demotePosMap            fragsInVars                 overlapInCore              run_greedy.csh
```