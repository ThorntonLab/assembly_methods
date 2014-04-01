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

Note that they are also in [SRA](http://www.ncbi.nlm.nih.gov/sra/?term=SRP040522), but I currently don't know how to bulk-download data like these from there.

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