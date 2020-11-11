#!/usr/local/opt/python/bin/python3.7

## #!/Applications/Anaconda/anaconda/bin/python3

# pip3 install biopandas
from biopandas.pdb import PandasPdb

# Initialize a new PandasPdb object
# and fetch the PDB file from rcsb.org
ppdb = PandasPdb().fetch_pdb('2hck')

ppdb.to_pdb(path='2hck.pdb', 
            records=None, 
            gz=False, 
            append_newline=True)
