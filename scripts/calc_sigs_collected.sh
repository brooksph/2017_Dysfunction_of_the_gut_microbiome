#calculate signatures for collected seqs 
for in in $(../scripts/collected_seqs.txt)
do 
	~/sourmash/sourmash compute -k 31 --scaled 10000 -o ${i} -f
done 

#Rename collected signatures to something useful 
#mv COLLECTING.fq.5.sig healthy_collected.sig
#mv IBD_COLLECTING.fq.2 ibd_collected.sig 

