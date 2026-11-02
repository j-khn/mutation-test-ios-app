#!/usr/bin/env python3
"""List Swift app/package source files for full or changed-source mutation runs."""
import argparse
import os
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parent.parent

def is_source(path):
    parts = Path(path).parts
    return path.endswith('.swift') and (parts[0] == 'App' or (parts[0] == 'Modules' and 'Sources' in parts))

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--scope', choices=['diff', 'full'], default='diff')
parser.add_argument('--base')
parser.add_argument('--head', default='HEAD')
parser.add_argument('--output', type=Path, required=True)
parser.add_argument('--github-output', action='store_true')
args = parser.parse_args()
if args.scope == 'full':
    files = [str(path.relative_to(ROOT)) for folder in ['App', 'Modules'] for path in (ROOT / folder).rglob('*.swift') if not any(part.startswith('.') for part in path.relative_to(ROOT).parts)]
else:
    base = args.base or f'{args.head}^'
    if set(base) == {'0'}:
        base = f'{args.head}^'
    diff = subprocess.check_output(['git', 'diff', '--name-only', '-z', '--find-renames', '--diff-filter=ACMRT', base, args.head, '--', 'App', 'Modules'], cwd=ROOT)
    files = diff.decode().strip('\0').split('\0') if diff else []
selected = sorted(set(path for path in files if is_source(path) and (ROOT / path).is_file()))
args.output.parent.mkdir(parents=True, exist_ok=True)
args.output.write_text(''.join(path + '\n' for path in selected))
if args.github_output:
    with open(os.environ['GITHUB_OUTPUT'], 'a') as stream:
        stream.write(f"has_sources={'true' if selected else 'false'}\n")
        stream.write('source_files<<MUTATION_SOURCE_FILES\n' + args.output.read_text() + 'MUTATION_SOURCE_FILES\n')
print(f'{args.scope}: {len(selected)} source files selected; tests remain the full MutationTestIOSAppTests target.')
