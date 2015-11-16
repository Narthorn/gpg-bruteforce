#!/usr/bin/python3 -u

import sys,exrex

lines = set(exrex.generate(sys.argv[1]))

if len(sys.argv) > 2:
	with open(sys.argv[2], 'a') as file:
		pass
	with open(sys.argv[2], 'r') as file:
		tried_lines = set(file.read().splitlines())
		lines = lines - tried_lines

tried = []
try:
	for line in lines:
		print(line)
		tried.append(line)

finally:
	print("%s: Tried %d new entries" % (sys.argv[0], len(tried)), file=sys.stderr)

	if len(sys.argv) > 2:
		with open(sys.argv[2], 'a') as file:
			for line in tried:
				file.write(line + "\n")
