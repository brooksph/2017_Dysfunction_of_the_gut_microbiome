#This script will calulate minHash signatures using sourmash at --scaled value of 10000 and k of 31

#load GNU and Python
module load GNU/6.2
module load Python/2.7.2

#activate virtual environment
source ~/env/bin/activate

#calculate signatures
for i in *pe.fq.gz
do
	~/sourmash/sourmash compute -k31 --scaled 10000 ${i} -f
done
