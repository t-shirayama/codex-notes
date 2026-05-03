# CodexのAI駆動開発と仕様駆動開発 実務ガイド（整理版）

## 概要

OpenAIの公式資料を横断すると、Codexの実務運用は以下の原則に集約される：

- 一発プロンプトではなく「継続的に改善するシステム」として扱う
- ルール・設定・手順・仕様をファイルとして外部化する
- 実装よりも先に仕様と検証を定義する

## コア設計思想

### 1. 役割分離

- AGENTS.md: 常時ルール
- config.toml: 実行環境
- skills: 再利用手順
- PLANS.md: 複雑タスク仕様

### 2. 仕様駆動

- spec → test → 実装

### 3. フィードバックループ

```txt
Prompt
  ↓
Plan
  ↓
Rules (AGENTS.md)
  ↓
Implementation
  ↓
Validation
  ↓
改善（AGENTS / skill / plan更新）
```

## ディレクトリ構成

```txt
repo/
├─ AGENTS.md
├─ .codex/
│   ├─ config.toml
│   └─ hooks/
├─ .agents/
│   └─ skills/
├─ docs/
│   ├─ specs/
│   ├─ validation/
│   └─ architecture/
├─ plans/
├─ evals/
└─ .github/workflows/
```

## 重要ルール

- AGENTS.mdは具体的に書く
- skillは単機能
- configは最初厳しく

## テスト

テストは仕様の一部として先に作る

## 導入手順

1. AGENTS.md
2. config
3. skill
4. ExecPlan
5. docs
6. eval
7. CI

## まとめ

- ルール外出し
- 手順再利用
- 仕様先行
- テスト先行
- 失敗は仕組みで潰す
