#!/usr/bin/env python3
"""Select an installed iPhone simulator; print an xcodebuild destination."""
import argparse
import json
import os
import re
import subprocess
from pathlib import Path

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--github-env', action='store_true')
args = parser.parse_args()
data = json.loads(subprocess.check_output(['xcrun', 'simctl', 'list', 'devices', 'available', '-j']))
candidates = []
for runtime, devices in data['devices'].items():
    if '.iOS-' not in runtime:
        continue
    version = tuple(int(part) for part in runtime.split('.iOS-')[-1].split('-'))
    if version < (17,):
        continue
    for device in devices:
        if device.get('isAvailable') and device['name'].startswith('iPhone'):
            candidates.append((device['state'] == 'Booted', version, device['name'], device['udid']))
override = os.environ.get('IOS_SIMULATOR_UDID')
if override:
    candidates = [candidate for candidate in candidates if candidate[-1] == override]
if not candidates:
    raise SystemExit('No available iPhone simulator for iOS 17 or later. Install an iOS runtime in Xcode Settings > Components.')
udid = max(candidates)[-1]
destination = f'platform=iOS Simulator,id={udid}'
if args.github_env:
    env_path = os.environ.get('GITHUB_ENV')
    if not env_path:
        raise SystemExit('--github-env requires GITHUB_ENV.')
    with Path(env_path).open('a') as stream:
        stream.write(f'IOS_DESTINATION={destination}\nIOS_SIMULATOR_UDID={udid}\n')
print(destination)
