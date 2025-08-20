# crackscriptfaster.py
from itertools import product
from collections import defaultdict

TARGET = 1113772777
SEED   = 0xA5A5A5A5
MASK   = 0xFFFFFFFF
CHARSET = [i for i in range(32,127)]   # printable
# CHARSET = list(range(48,58))  # digits-only (much smaller)

def forward_hash_from_seed(bytes_seq, start_seed=SEED):
    h = start_seed
    for b in bytes_seq:
        h = ((h * 31) + b) & MASK
    return h

def base31_from_zero(bytes_seq):
    h = 0
    for b in bytes_seq:
        h = ((h * 31) + b) & MASK
    return h

def mitm_for_length(n, charset=CHARSET):
    # split
    left_len = n // 2
    right_len = n - left_len
    pow31_right = pow(31, right_len, 1 << 32)

    print(f"MITM: left_len={left_len}, right_len={right_len}, charset_size={len(charset)}")

    # build map for right halves: value -> one example bytes
    right_map = dict()
    for tup in product(charset, repeat=right_len):
        rb = bytes(tup)
        rval = base31_from_zero(rb)
        # store one representative (or append to list if you want all)
        if rval not in right_map:
            right_map[rval] = rb

    # now enumerate left halves and look up matching right
    for tup in product(charset, repeat=left_len):
        lb = bytes(tup)
        left_hash = forward_hash_from_seed(lb)  # hash after left part
        need = (TARGET - (left_hash * pow31_right)) & MASK
        if need in right_map:
            candidate = lb + right_map[need]
            if forward_hash_from_seed(candidate) == (TARGET & MASK):
                return candidate
    return None

if __name__ == "__main__":
    # try different lengths
    for n in range(1, 7):   # adjust upper bound as you want
        print("Trying length", n)
        sol = mitm_for_length(n)
        if sol:
            print("FOUND:", sol, sol.decode(errors='replace'))
            break
    else:
        print("No solution found in range tried.")
