# brute_force_printable.py
from itertools import product

TARGET = 1113772777
SEED = 0xA5A5A5A5
MASK = 0xFFFFFFFF
CHARSET = [i for i in range(32, 127)]  # printable ASCII
# reduce charset for testing: CHARSET = list(range(48,58))  # digits only

def hash32(bytes_seq):
    h = SEED
    for b in bytes_seq:
        h = ((h * 31) + b) & MASK
    return h

def brute_len(n):
    for tup in product(CHARSET, repeat=n):
        b = bytes(tup)
        if hash32(b) == (TARGET & MASK):
            return b
    return None

if __name__ == "__main__":
    max_len = 5   # keep very small
    for n in range(0, max_len+1):
        print(f"trying length={n}")
        sol = brute_len(n)
        if sol is not None:
            print("FOUND:", sol, sol.decode(errors='replace'))
            break
    else:
        print("no solution found up to", max_len)
