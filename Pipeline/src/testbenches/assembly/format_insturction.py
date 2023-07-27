import binascii
import struct

i = 0
with open('sssp_mybellman.hex', 'r') as f:
    with open('sssp_mybellman.txt', 'w') as o:
        for line in f:
            hex_string = line.strip()
            instruction = f'16\'d{i}:  Instruction <= 32\'h{hex_string};\n'
            o.write(instruction)
            i += 1
