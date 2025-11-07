# Swift 題解說明

## SwiftPM 結構（題目為中心）
- `Package.swift`：Swift Package 管理設定，Target 名稱 `Practice`。
- `problems/`：所有 Swift 題解檔案直接置於此目錄（不再依分類分子資料夾），例如 `problems/LC0001_TwoSum.swift`。
- `tests/`：對應的 `XCTestCase` 檔案，命名與題號對齊，例如 `tests/LC0001_TwoSumTests.swift`。

## IDE 開啟建議
- **Xcode**：於終端輸入 `open Package.swift`（在 `swift/` 目錄內）或在 Xcode 選單 `File > Open` 選擇 `Package.swift`，即會生成 SwiftPM 專案；`Product > Test` 可執行整套測試。
- **VS Code（Swift 擴充）**：`code .`（在 `swift/` 目錄）並啟用 `SourceKit-LSP`，終端直接用 `swift build`、`swift test`。
- **AppCode 或其他 Swift IDE**：同樣指向 `Package.swift` 以 SwiftPM 模式載入即可。

## 檔案命名
- 題解：`LC<四位數題號>_<題名 CamelCase>.swift`，例如 `LC0105_ConstructBinaryTree.swift`。
- 測試檔：`LC0105_ConstructBinaryTreeTests.swift`。
- 若同題多個寫法，可加後綴 `_Iterative`、`_DP` 等說明策略。

## 新增題目的建議步驟
1. 在 `problems/` 建立檔案，例如 `LC0121_BestTimeToBuyAndSellStock.swift`，並定義 `struct SolutionLC0121 { ... }`。
2. 在 `tests/` 建立對應 `XCTestCase`，命名採 `LC0121_BestTimeToBuyAndSellStockTests.swift`，以 `@testable import Practice` 引入模組。
3. 若需要在 `swift run Practice` 測試，可在 `problems/main.swift` 引用該題的 `Solution`，或改寫為讀取輸入的方式。

## 常用指令
- 執行：`swift run Practice`
- 測試：`swift test`
- 格式化（若已安裝 swift-format）：`swift-format format -i problems/*.swift tests/*.swift`
