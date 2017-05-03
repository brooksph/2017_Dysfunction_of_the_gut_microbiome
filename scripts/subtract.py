#! /usr/bin/env python
from __future__ import print_function
import sys
import screed
import sourmash_lib.signature
import copy

print('loading', sys.argv[1])
in_fp = open(sys.argv[1])
sigs = list(sourmash_lib.signature.load_signatures(in_fp))
assert len(sigs) == 1
sig = sigs[0]

mins = set(sig.minhash.get_mins())
orig_mins = set(mins)

for filename in sys.argv[2:]:
    print('subtracting', filename)
    sigs = list(sourmash_lib.signature.load_signatures(open(filename)))
    assert len(sigs) == 1
    submins = sigs[0].minhash.get_mins()
    submins = set(submins)

    mins = mins - submins

print('started with {} hashes, ended with {}'.format(len(orig_mins),
                                                     len(mins)))

new_minhash = sig.minhash.copy_and_clear()
new_minhash.add_many(mins)
sig.minhash = new_minhash

out_fp = open(sys.argv[1] + '.sub', 'wt')
print(sourmash_lib.signature.save_signatures([sig]), file=out_fp)
