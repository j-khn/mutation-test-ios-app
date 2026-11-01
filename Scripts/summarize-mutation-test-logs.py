#!/usr/bin/env python3
"""Summarize test-case counts from swift-mutation-testing's per-mutant logs."""

import re
import sys
from pathlib import Path


SWIFT_TEST_SUMMARY = re.compile(r"Test run with\s+(\d+)\s+tests?\b", re.IGNORECASE)
XCTEST_SUMMARY = re.compile(r"Executed\s+(\d+)\s+tests?,\s+with\b", re.IGNORECASE)
MUTANT_ID = re.compile(r"^mutant:\s*(\S+)", re.MULTILINE)
SOURCE_LOCATION = re.compile(r"^location:\s*(.+):\d+:\d+\s*$", re.MULTILINE)


def reported_count(contents: str):
    swift_summaries = SWIFT_TEST_SUMMARY.findall(contents)
    if swift_summaries:
        return int(swift_summaries[-1]), "Swift Testing summary"

    xctest_summaries = XCTEST_SUMMARY.findall(contents)
    if xctest_summaries:
        return int(xctest_summaries[-1]), "XCTest summary"

    return None, "summary not found"


def main(log_directory: Path) -> int:
    logs = sorted(log_directory.rglob("*.log")) if log_directory.is_dir() else []
    if not logs:
        print("## Test cases run by the existing mutation tool\n")
        print("No per-mutant logs were produced (the results may all have come from cache).")
        return 0

    rows = []
    for path in logs:
        contents = path.read_text(encoding="utf-8", errors="replace")
        mutant_match = MUTANT_ID.search(contents)
        source_match = SOURCE_LOCATION.search(contents)
        count, source = reported_count(contents)
        rows.append((
            source_match.group(1) if source_match else "Unknown source",
            mutant_match.group(1) if mutant_match else path.stem,
            count,
            source,
        ))

    print("## Test cases run by the existing mutation tool\n")
    print("Counts come from each mutant's captured Xcode test output. The baseline run is separate and is not included below.\n")
    print("| Mutated source file | Mutant | Test cases reported |")
    print("|---|---|---:|")
    for source_file, mutant, count, _ in rows:
        count_text = str(count) if count is not None else "not reported"
        print(f"| `{source_file}` | `{mutant}` | {count_text} |")

    counted = [row for row in rows if row[2] is not None]
    total = sum(row[2] for row in counted)
    print(f"\n**Mutant test cases reported:** {total} across {len(counted)}/{len(rows)} mutant logs.")
    if len(counted) != len(rows):
        missing = ", ".join(row[1] for row in rows if row[2] is None)
        print(f"\nTest count summary was missing from: {missing}.")

    return 0


if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("Usage: summarize-mutation-test-logs.py LOG_DIRECTORY")
    raise SystemExit(main(Path(sys.argv[1])))
