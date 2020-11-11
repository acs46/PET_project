from modeller import *

env = environ()
aln = alignment(env)
mdl = model(env, file='1jfr', model_segment=('FIRST:A','LAST:A'))
aln.append_model(mdl, align_codes='1jfrA', atom_files='1jfr.pdb')
aln.append(file='pet1.ali', align_codes='BURK')
aln.align2d()
aln.write(file='BURK-1jfrA.ali', alignment_format='PIR')
aln.write(file='BURK-1jfrA.pap', alignment_format='PAP')
