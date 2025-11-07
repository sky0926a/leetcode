# LeetCode Practice (Go & Swift)

這個倉庫用來集中管理 LeetCode 刷題紀錄，分成 Go 與 Swift 兩種語言，並附上練習目標、分類清單與建議的檔案命名方式，方便後續擴充。

## Layout
- `problems/<id>-<slug>/` — `handmade.go` (primary solution), `solution.gobk` (reference/alt), `solution_test.go`, `analysis.md` notes.
- `swift/problems/` — Swift solutions per problem (e.g., `LC0001_TwoSum.swift`) plus `main.swift`.
- `swift/tests/` — Swift `XCTestCase` files aligned to problem IDs.
- `docs/` — roadmap and problem lists.
- `scripts/new_problem.py` + `Makefile` — scaffold new Go or Swift problems.

## Workflow
1. Scaffold: `make empty go 20 "Valid Parentheses"` creates `problems/0020-valid-parentheses`; `make empty swift 121 Best Time to Buy and Sell Stock` writes Swift stubs under `swift/problems/` and `swift/tests/`.
2. Implement Go in `handmade.go` (package name is the slug without hyphens; functions use lowerCamelCase like lt-train). Keep an alternative/reference in `solution.gobk` if helpful.
3. Add tests in `solution_test.go` and notes in `analysis.md` (problem statement, approach, complexity, pitfalls).
4. Run `go test ./...` for Go or `cd swift && swift test` for Swift.

## Notes
- Progress tracking stays in `docs/`.
- Default Go version in `go.mod` is 1.21; bump it if you upgrade the toolchain.
