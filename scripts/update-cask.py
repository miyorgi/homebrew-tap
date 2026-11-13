#!/usr/bin/env python3
"""Update the cask from the published, signed macOS release manifest."""
import argparse
import json
from pathlib import Path
import re
from urllib.request import urlopen, Request

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--manifest', type=Path)
parser.add_argument('--check', action='store_true')
args = parser.parse_args()
url = 'https://downloads.miyorgi.com/c4/latest.json'
if args.manifest:
    manifest = json.loads(args.manifest.read_text())
else:
    with urlopen(Request(url, headers={'User-Agent': 'miyorgi-homebrew-tap'}), timeout=30) as response:
        manifest = json.load(response)
version = manifest.get('version', '')
if manifest.get('schemaVersion') != 1 or manifest.get('signed') is not True:
    raise SystemExit('Refusing a release without verified signing metadata')
if not re.fullmatch(r'[0-9A-Za-z][0-9A-Za-z._-]*', version):
    raise SystemExit('Invalid version')
checksums = {}
download_suffixes = set()
for arch in ['arm64', 'amd64']:
    items = [a for a in manifest.get('archives', []) if a.get('os') == 'darwin' and a.get('arch') == arch]
    if len(items) != 1:
        raise SystemExit('Both Mac architectures must be present exactly once')
    archive = items[0]
    expected = f'https://downloads.miyorgi.com/c4/{version}/miyorgi-c4-{version}-darwin-{arch}.zip'
    if archive.get('url') not in (expected, expected + '?download=1') or not re.fullmatch(r'[a-f0-9]{64}', archive.get('sha256', '')):
        raise SystemExit('Unexpected archive URL or checksum')
    if archive.get('signed') is not True:
        raise SystemExit('Archive is not marked signed')
    checksums[arch] = archive['sha256']
    download_suffixes.add(archive['url'][len(expected):])
if len(download_suffixes) != 1:
    raise SystemExit('Archive URLs must use the same download suffix')
download_suffix = download_suffixes.pop()
path = Path(__file__).resolve().parents[1] / 'Casks/c4.rb'
text = path.read_text()
text, count = re.subn(r'  version "[^"]+"', f'  version "{version}"', text)
assert count == 1
text, count = re.subn(r'  sha256 arm:   "[a-f0-9]+",\n         intel: "[a-f0-9]+"',
                     f'  sha256 arm:   "{checksums["arm64"]}",\n         intel: "{checksums["amd64"]}"', text)
assert count == 1
text, count = re.subn(
    r'(  url "https://downloads\.miyorgi\.com/[^"]+?\.zip)(?:\?download=1)?"',
    lambda match: match[1] + download_suffix + '"',
    text,
)
assert count == 1
if args.check:
    if text != path.read_text():
        raise SystemExit('Cask does not match the published manifest')
else:
    path.write_text(text)
print(f'Cask matches signed release {version}')
