enc = b'\xdd\xda\xf6\xd9\xc4\xc6\xf6\xce\xc7\xce\xf6\xc0\xca\xc5'
s = []
for c in enc:
    c = chr(c ^ 0xA9)
    s.append(c)
print("".join(s))