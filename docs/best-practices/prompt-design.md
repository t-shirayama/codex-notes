# プロンプト設計の基本

> - 種別: official
> - 参考元: [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)
> - 最終ファクトチェック: 2026-05-04
> - 確認メモ: プロンプト設計の基本要素と明確な指示の重要性を確認

## 概要

Codexに強い出力をしてもらうには、長い説明より「何を」「どこで」「どこまで」を揃えることが重要です。

## 基本要素

### 目的

- 何を達成したいか
- なぜ今それをやるか

### 対象

- 関連ファイル
- 参考にすべきドキュメント
- エラーメッセージ

### 制約

- 変えてはいけないもの
- 守るべき設計
- 既存ルール

### 完了条件

- テスト
- 動作
- 説明

## 使い分け

- 小タスク: 直接依頼する
- 曖昧なタスク: `/plan` を使う
- 繰り返し依頼: `AGENTS.md` や `skill` に寄せる

## 具体例

```txt
目的:
検索結果一覧の空状態を改善したい

対象:
@src/components/SearchResult.tsx

制約:
既存のpropsは変えない

完了条件:
空状態の文言と補助説明を追加し、差分を要約する
```

## 避けたい書き方

- `いい感じに直して`
- `全部見て必要なら修正して`
- 背景だけ長く、変更対象がない

## 参考元

このページは以下の参考元に基づいて整理しています。未確認の推測は含めていません。

- [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)
- [OpenAI Prompt engineering guide](https://platform.openai.com/docs/guides/prompt-engineering/strategies-to-improve-reliability)
- [OpenAI Prompting guide](https://platform.openai.com/docs/guides/prompting)
