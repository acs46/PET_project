#!/Applications/Anaconda/anaconda/bin/python3

import os.path
from Bio import Entrez, SeqIO
from Bio import File

Entrez.email = 'astuart@ramapo.edu'

f = open('petase_seq_out.txt','w')

handle = Entrez.esearch(db="protein", term="petase", usehistory="y")
result = Entrez.read(handle)
handle.close()

count          = int(result["Count"])
session_cookie = result["WebEnv"]
query_key      = result["QueryKey"]

print(count, session_cookie, query_key)

# Get the results in chunks of 100
chunk_size = 100
for chunk_start in range(0,count,chunk_size) :
    handle = Entrez.efetch(db="nucleotide", rettype="gb",
                           retstart=chunk_start, retmax=chunk_size, 
                           webenv=session_cookie, query_key=query_key)
    for r in SeqIO.parse(handle,"genbank"):
        print(r.id, r.description)
#        f.write(r.id, r.description)

    handle.close()
    f.close()

