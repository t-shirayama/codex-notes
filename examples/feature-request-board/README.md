# Feature Request Board

## 概要

Codex向けドキュメントと運用資産をどう揃えるかの最小例です。

## 含まれるもの

- `AGENTS.md`
- `context.json`
- `docs/specs/story-001-login/requirement.md`
- `docs/specs/story-001-login/plan.md`
- `docs/guidelines/review.md`

## 使いどころ

機能単位で要件、計画、実装コンテキストを分けたいときのたたき台として使います。

## 具体例

新機能 `story-001-login` を始めるなら、`requirement.md`、`plan.md`、`context.json` を同じフォルダに置くと追跡しやすくなります。

## 進め方

1. `context.json` で作業単位と関連ファイルを確認する
2. `docs/specs/story-001-login/requirement.md` で受け入れ条件を読む
3. `docs/specs/story-001-login/plan.md` に沿って実装する
4. `docs/guidelines/review.md` の観点で差分を確認する

## context.json の扱い

`changed_files` は作業前は空配列にしておきます。変更後は、実際に更新したファイルを追加します。

```json
"changed_files": [
  "docs/specs/story-001-login/requirement.md",
  "docs/specs/story-001-login/plan.md"
]
```
