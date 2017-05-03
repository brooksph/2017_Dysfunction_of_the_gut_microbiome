#This script will calculate the jacard index for minhash signatures and generate a numpy matrix
module load GNU/6.2
module load Python/2.7.2

#Activate the virtual environment
source ~/env/bin/activate

#Calculate the jaccard indices and generate matrix called IBD_samples

~/sourmash/sourmash compare -k 31 *gz.sig -o IBD_samples

