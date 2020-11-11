#!/Applications/Anaconda/anaconda/bin/python3.6

from Bio import Entrez, Medline, SeqIO
Entrez.email = "astuart@ramapo.edu" 


handle = Entrez.esearch(db="pubmed", term="petase", retmax=200)
record = Entrez.read(handle)
idlist = record["IdList"]

print("10 Id's for PubMed IDs of articles related to Petase:\n {}".format(idlist[:10]))

handle = Entrez.efetch(db="pubmed", id=idlist, rettype="medline")
records = Medline.parse(handle)
records = list(records)

for record in records:
    print("title:", record.get("TI", "?"))
    print("authors:", record.get("AU", "?"))
    print("source:", record.get("SO", "?"))
    print("")
