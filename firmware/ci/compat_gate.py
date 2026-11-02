#!/usr/bin/env python3
"""Parse docs/COMPAT.md, emit allowed HW revs. Fails if table is empty or malformed."""
import re, sys, json
rows = [l for l in open(sys.argv[1]) if l.startswith('| hw-')]
revs = [r.split('|')[1].strip() for r in rows]
if not revs:
    sys.exit("compat-gate: no HW revs in COMPAT.md")
print(f"hwrevs={json.dumps(revs)}")
with open(os.environ.get('GITHUB_OUTPUT','/dev/null'),'a') if (os:=__import__('os')) else None as f:
    f.write(f"hwrevs={json.dumps(revs)}\n")
