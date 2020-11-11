#!/Applications/Anaconda/anaconda/bin/python3

from Bio import Entrez

Entrez.email = 'astuart@ramapo.edu'

handle = Entrez.egquery(term="petase")
record = Entrez.read(handle)
for row in record["eGQueryResult"]:
    if row["DbName"]=="pubmed":
        print(row["Count"])

handle = Entrez.esearch(db="pubmed", term="petase", usehistory="y", retmax=300)

record = Entrez.read(handle)
idlist = record["IdList"]

count          = int(record["Count"])
session_cookie = record["WebEnv"]
query_key      = record["QueryKey"]
print("Count",count,"\nSession Cookie", session_cookie, "\nQuery Key",query_key)

print("\nThe first 10 Id's containing all of the PubMed IDs of articles related to petase:\n {}\n".format(idlist[:10]))

from Bio import Medline
handle = Entrez.efetch(db="pubmed", id=idlist, rettype="medline")

records = Medline.parse(handle)
records = list(records) #convert iterator (reads once only) to records to list

for record in records:
    print("title:", record.get("TI", "?"))
    print("authors:", record.get("AU", "?"))
    print("source:", record.get("SO", "?"))
    print("")


