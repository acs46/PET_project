#!/Applications/Anaconda/anaconda/bin/python3

from Bio.PDB import PDBList

pdbl = PDBList()
pdbl.retrieve_pdb_file('1JFR',pdir="/Users/astuart/Ramapo/Research/PlasticDegradingEnzymes/modeller/basic-example/", file_format='pdb')

##download_pdb_files(self, pdb_codes, obsolete=False, pdir=None, file_format='pdb', overwrite=False)

#mylist=['6eqd','6ane','5yfe','5xjh','5xg0','5xfy','5xfz','5xh3','5yns']

#pdbl.download_pdb_files(mylist, obsolete=False, pdir="/Users/astuart/Ramapo/Research/PlasticDegradingEnzymes/Structures/", file_format='pdb')
