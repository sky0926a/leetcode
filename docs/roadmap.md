# 刷題 Roadmap

## 核心目標：以 Grind 75 為主
1. 10 週內完整走完 [Grind 75 題單](https://www.techinterviewhandbook.org/grind75/)（參考 [LeetCode CN 彙整](https://leetcode.cn/discuss/post/3582728/fen-xiang-yi-xia-grind-75ti-dan-by-kewei-8w83/) 方便跳轉），至少 60 題提交通過，並將難點題標記待複做。
2. Go 與 Swift 各至少完成 35 題；遇到經典題（Two Sum、LRU、Binary Tree 系列等）優先雙語實作以累積語法肌肉記憶。
3. 每週固定 1~2 次複盤：整理錯誤類型、複習模板程式，並對 Grind 75 清單進行狀態更新。
4. 每階段尾聲挑 2~3 題計時演練，模擬面試並檢查敘述／複雜度分析是否順暢。

> Grind 75 網站可以依「每週可投入時數」與「總週數」客製建議清單。以下以 10 週、每週 7~8 題為基準，可依實際時間調整並回填於下表。

## 10 週節奏建議（題號依 Grind 75 原順序）
| 週次 | 主題聚焦 | Grind 75 題目 | 操作建議 |
| --- | --- | --- | --- |
| Week 1 | 陣列／雜湊暖身、Easy 題熟悉流程 | #1–#8（Two Sum、Valid Parentheses…Binary Search） | 建立模板：頻率表、雙指針、基礎 DFS/BFS；完成後立即在 `docs/problem-list.md` 勾選。 |
| Week 2 | Tree + Linked List 基本功 | #9–#16（Flood Fill、LCA、栈轉佇列、Climb Stairs…） | 同題做 Go/Swift 差異筆記，練習遞迴與迭代寫法。 |
| Week 3 | Prefix / Binary Tree 深入 + Interval 入門 | #17–#24（Reverse List、Majority、Diameter、Contains Duplicate…） | 針對樹題撰寫 helper，週末回顧所有 DFS 呼叫順序。 |
| Week 4 | Sliding Window、BFS、排序＋雙指針 | #25–#32（Insert Interval → Clone Graph） | 嘗試以測試表覆蓋 corner cases；開始整理圖題常見陷阱。 |
| Week 5 | Stack / Graph / 設計題 | #33–#40（RPN、Course Schedule、Trie、Coin Change…Number of Islands） | 每天至少 1 題中等難度，以 whiteboard 方式講解思路。 |
| Week 6 | BFS/DFS 進階與 Union-Find、帳戶合併 | #41–#48（Rotting Oranges → Accounts Merge） | 針對難題（Accounts Merge、Time-based KV）畫狀態圖再開寫程式。 |
| Week 7 | DP、字串、回溯複習 | #49–#56（Sort Colors → Longest Palindrome） | 以一題多解為目標（DP vs. 回溯 vs. 雙指針）並記錄複雜度差異。 |
| Week 8 | Tree 建構、Two Pointers、高頻字串題 | #57–#64（Unique Paths → Task Scheduler） | 固定安排 1 題 Hard（Minimum Window / Task Scheduler），練習說明優化思路。 |
| Week 9 | 設計題＋高難度滑窗／堆 | #65–#72（LRU → Basic Calculator） | 針對 LRU、Median Finder 等撰寫類別骨架與測試；複習優化空間複雜度。 |
| Week 10 | 最後衝刺與複盤 | #73–#75（Job Scheduling、Merge K Lists、Largest Rectangle）+ 全清單複查 | 重新做三題錯題、整理最常用模板（Union-Find、Monotonic Stack、Heap）；完成後產出簡短總結。 |

## 每週節奏（可依實際時間微調）
- **Day 1：規劃**　確定本週要解的 Grind 75 題（7~8 題），分配語言並估算完成時間。
- **Day 2-4：實作**　每天至少 2 題，交替語言；若遇到卡關 >30 分鐘先寫下思路再看提示，不立即看解答。
- **Day 5：複盤**　整理當週題目在 `docs/problem-list.md` 的備註（錯誤原因、可重寫需求）。
- **Day 6：回寫／延伸**　挑 1 題以另一種資料結構重寫或嘗試優化；若剩餘時間，補上升級挑戰題。
- **Day 7：休息＋總結**　回顧筆記、列出下週要複習的兩個主題並更新 Roadmap/Problem List。

## 例行檢查點
- **每 2 週**：統計完成題數、語言覆蓋率以及仍不熟的主題，必要時調整每週題數或語言分配。
- **每 4 週**：挑 3 題（Easy/Medium/Hard），以 45~60 分鐘計時模式完成並錄音，檢查講解是否順暢。
- **完成 Grind 75 後**：整理 10 題代表作寫成解題稿（題意、思路、複雜度、程式片段），作為面試前複習資料。

## 進階延伸與備用題單
- `docs/problem-list.md` 中原有的分類題單仍保留，可作為補強題庫；若 Grind 75 某主題特別薄弱，從對應區塊挑題加練。
- SQL 與併發題：維持原本「每日 1 題 SQL、每週 1 題 Concurrency」的習慣，並在 `problem-list` 備註欄勾選，避免長期只刷演算法題。
- 若時間允許，可將 Grind 75 中標記的 Hard 題第二次實作時改寫另一語言或嘗試不同策略（如 `Trapping Rain Water` 改寫成 stack + two pointers 雙版本）。
