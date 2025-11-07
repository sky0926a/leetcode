#!/usr/bin/env python3
"""Utility script to scaffold empty Go / Swift solution files."""
from __future__ import annotations

import re
import sys
from pathlib import Path


def usage() -> None:
    print(
        "Usage: make empty <go|swift> <problem-id> <name>\n"
        "Example: make empty go 20 \"Valid Parentheses\"",
        file=sys.stderr,
    )
    sys.exit(1)


def extract_digits(value: str) -> str:
    digits = re.findall(r"\d+", value)
    if not digits:
        raise ValueError("problem id must contain at least one digit")
    return "".join(digits)


def normalize_ids(raw: str, lang: str) -> tuple[str, str]:
    digits = extract_digits(raw)
    if len(digits) < 4:
        digits = digits.zfill(4)
    if lang == "go":
        return digits, digits
    return f"LC{digits}", digits


def split_words(value: str) -> list[str]:
    if not value:
        raise ValueError("name must not be empty")
    cleaned = re.sub(r"[_\-]+", " ", value.strip())
    cleaned = re.sub(r"([a-z0-9])([A-Z])", r"\1 \2", cleaned)
    parts = [part for part in re.split(r"\s+", cleaned) if part]
    if not parts:
        raise ValueError("name must contain alphanumeric characters")
    return parts


def to_kebab(value: str) -> str:
    parts = split_words(value)
    return "-".join(part.lower() for part in parts)


def to_pascal(value: str) -> str:
    parts = split_words(value)
    return "".join(part.capitalize() for part in parts)


def to_camel(value: str) -> str:
    pascal = to_pascal(value)
    if not pascal:
        return ""
    return pascal[0].lower() + pascal[1:]


def prompt_directory(options: list[str], label: str) -> str:
    if not options:
        raise RuntimeError(f"No available directories under {label}.")
    print(f"\nSelect {label}:")
    for idx, name in enumerate(options, start=1):
        print(f"  [{idx}] {name}")
    while True:
        choice = input(f"Choose 1-{len(options)} (default 1): ").strip()
        if not choice:
            return options[0]
        if choice.isdigit():
            index = int(choice)
            if 1 <= index <= len(options):
                return options[index - 1]
        print("Invalid selection, please try again.")


def write_file(path: Path, content: str) -> bool:
    if path.exists():
        print(f"Skipped existing file: {path}")
        return False
    path.write_text(content)
    print(f"Created: {path}")
    return True


def scaffold_go(root: Path, problem_id: str, digits: str, name: str) -> None:
    problems_root = root / "problems"
    if not problems_root.exists():
        raise RuntimeError("problems directory not found")

    kebab = to_kebab(name)
    package_name = kebab.replace("-", "")
    if package_name and package_name[0].isdigit():
        package_name = f"p{package_name}"
    func_name = to_camel(name) or "solve"
    title = " ".join(part.capitalize() for part in split_words(name))
    problem_dir = problems_root / f"{digits}-{kebab}"
    problem_dir.mkdir(parents=True, exist_ok=True)

    analysis_content = f"""# {title}

## Problem
- TODO: copy the original description here for quick reference.

## Approach
- TODO: outline the idea, key steps, and any pitfalls.

## Complexity
- Time: TODO
- Space: TODO
"""

    handmade_content = f"""package {package_name}

// {func_name} is the primary solution entrypoint. Fill in the real signature.
func {func_name}() {{
\t// TODO: implement {title}
}}
"""

    test_content = f"""package {package_name}

import "testing"

func Test{to_pascal(name)}(t *testing.T) {{
\tt.Skip("TODO: add test cases for {title}")
}}
"""

    reference_content = f"""package {package_name}

// Keep a reference solution or alternative approach here when ready.
func {func_name}() {{
\t// TODO: implement reference solution for {title}
}}
"""

    write_file(problem_dir / "analysis.md", analysis_content)
    write_file(problem_dir / "handmade.go", handmade_content)
    write_file(problem_dir / "solution_test.go", test_content)
    write_file(problem_dir / "solution.gobk", reference_content)


def scaffold_swift(root: Path, problem_id: str, digits: str, name: str) -> None:
    swift_sources = root / "swift" / "problems"
    swift_tests = root / "swift" / "tests"
    if not swift_sources.exists():
        raise RuntimeError("swift/problems directory not found")
    if not swift_tests.exists():
        swift_tests.mkdir(parents=True, exist_ok=True)

    pascal = to_pascal(name)
    kebab = to_kebab(name)
    struct_name = f"Solution{problem_id}"
    test_class = f"{problem_id}_{pascal}Tests"
    title = " ".join(split_words(name)).title()

    source_file = swift_sources / f"{problem_id}_{pascal}.swift"
    test_file = swift_tests / f"{problem_id}_{pascal}Tests.swift"

    swift_content = f"""struct {struct_name} {{
    // TODO: Implement {title} ({problem_id}).
}}
"""

    test_content = f"""import XCTest
@testable import Practice

final class {test_class}: XCTestCase {{
    func testExamples() throws {{
        throw XCTSkip(\"TODO: add test coverage for {problem_id} {title}\")
    }}
}}
"""

    write_file(source_file, swift_content)
    write_file(test_file, test_content)


def main() -> None:
    args = sys.argv[1:]
    if len(args) < 3:
        usage()
    lang = args[0].lower()
    raw_id = args[1]
    raw_name = " ".join(args[2:]).strip()
    root = Path(__file__).resolve().parents[1]

    if lang not in {"go", "swift"}:
        print("Language must be 'go' or 'swift'", file=sys.stderr)
        usage()

    problem_id, digits = normalize_ids(raw_id, lang)

    try:
        if lang == "go":
            scaffold_go(root, problem_id, digits, raw_name)
        else:
            scaffold_swift(root, problem_id, digits, raw_name)
    except Exception as exc:  # noqa: BLE001
        print(f"Error: {exc}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
