# PLAN.md

## Goal

`codex-memo-review.md` のレビュー結果をもとに、Codex関連ドキュメントの古い記述や曖昧な表現を修正し、2026年5月時点の公式情報に沿った日本語ナレッジベースに近づける。

## Source

- [codex-memo-review.md](./codex-memo-review.md)
- [OpenAI Codex Docs](https://developers.openai.com/codex)
- [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)
- [OpenAI Codex AGENTS.md Guide](https://developers.openai.com/codex/guides/agents-md)
- [OpenAI Codex Hooks Guide](https://developers.openai.com/codex/hooks)

## Constraints

- 公式仕様と運用上の解釈を混ぜない。
- 既存ファイルの更新を優先し、同じ内容の新規記事は作らない。
- 参考元を差し替えた場合は、本文中の参考リンクも更新する。
- 初心者向けの記事では、詳細仕様を本文に詰め込みすぎず、補足として読める粒度にする。
- 目次や導線を変えた場合は、必要に応じて [docs/SUMMARY.md](./docs/SUMMARY.md) または [README.md](./README.md) も更新する。

## Tasks

### High Priority

- [x] [docs/operations/hooks.md](./docs/operations/hooks.md) の参考元を `Hooks - Codex` に差し替える。
  - 現在の Help Center / Codex cloud overview だけに依存した説明を見直す。
  - 参考リンクに [OpenAI Codex Hooks Guide](https://developers.openai.com/codex/hooks) を追加または置換する。

- [x] [docs/operations/hooks.md](./docs/operations/hooks.md) の hooks 置き場を公式仕様に合わせて修正する。
  - ユーザー共通: `~/.codex/hooks.json` または `~/.codex/config.toml`
  - リポジトリ単位: `.codex/hooks.json` または `.codex/config.toml`
  - plugin 配布時: plugin manifest または `hooks/hooks.json`
  - `.codex/hooks/` は「共有スクリプト置き場として使う場合がある」程度に弱める。

- [x] [docs/operations/hooks.md](./docs/operations/hooks.md) に feature flag の確認を補足する。
  - 例: `config.toml` の `[features] codex_hooks = true` を確認する。
  - 必須条件か、環境による注意点かを公式記述に照らして表現する。

- [x] [docs/getting-started/vscode-codex.md](./docs/getting-started/vscode-codex.md) の Reasoning Effort に `Extra High` を追加する。
  - `Low` / `Medium` / `High` / `Extra High` の4段階として整理する。
  - `Extra High` は「長時間・自律的・推論負荷の高い作業」に向く、という実務判断を添える。

- [x] [docs/getting-started/vscode-codex.md](./docs/getting-started/vscode-codex.md) の `Agent (Full Access)` 説明を弱める。
  - `Full Access = 常に確認なし` と読める表現を避ける。
  - 確認有無やアクセス範囲は `approval policy` と `sandbox mode` に依存する、と説明する。
  - 信頼できるリポジトリで段階的に広げる判断基準を添える。

### Medium Priority

- [x] [docs/operations/agents-md.md](./docs/operations/agents-md.md) に `AGENTS.override.md` を補足する。
  - 公式仕様として存在することを脚注または補足欄で扱う。
  - 初心者向け本文の流れを崩さない粒度にする。

- [x] [docs/operations/agents-md.md](./docs/operations/agents-md.md) に「近い階層の指示が後勝ちになる」点を補足する。
  - グローバル、リポジトリ、サブディレクトリの関係を短く整理する。
  - 具体例として、サブディレクトリ配下だけ別ルールを適用するケースを入れる。

- [x] [docs/official/best-practices.md](./docs/official/best-practices.md) に `/review` や diff レビューの導線を追加する。
  - 使う場面: PR前、広範囲変更後、レビュー観点を固定したいとき。
  - 「実装依頼」と「レビュー依頼」を分けると何が楽になるかを1段落で説明する。

- [x] [README.md](./README.md) に「このリポジトリは実行コードではなくドキュメント集」という一文を追加する。
  - 初見の人が、アプリケーションリポジトリではなくCodex運用メモだと分かる位置に置く。
  - 例: 冒頭説明または `何があるか` の前。

### Low Priority

- [x] 各記事冒頭に `種別: official / curation / operations` を置くか検討する。
  - `official` と `operations` の境界が曖昧になりやすい記事を洗い出す。
  - 先に1から2記事で試し、読みやすさを確認してから横展開する。

- [x] [docs/operations/article-registry.md](./docs/operations/article-registry.md) に今回の修正対象の確認日とメモを反映する。
  - 公式情報の再確認日を更新する。
  - `checked` が恒久保証ではなく確認日時点の記録である、という既存方針は維持する。

## Acceptance Criteria

- `hooks.md` の hooks 置き場と参考元が、公式の `Hooks - Codex` ページと矛盾しない。
- `vscode-codex.md` に Reasoning Effort の `Extra High` が含まれている。
- `Agent (Full Access)` の説明が、`approval policy` と `sandbox mode` に依存する表現になっている。
- `agents-md.md` に `AGENTS.override.md` と階層ルールの補足がある。
- `best-practices.md` にレビュー用途の導線がある。
- READMEから、このリポジトリがCodex運用ドキュメント集であることが初見でも分かる。
- 変更した記事には、必要な参考元リンクがMarkdownリンクとして残っている。

## Suggested Order

1. `hooks.md` の公式仕様ズレを直す。
2. `vscode-codex.md` の Reasoning Effort と Full Access 表現を直す。
3. `agents-md.md` と `best-practices.md` の補足を入れる。
4. `README.md` と `article-registry.md` を更新する。
5. リンク、目次、参考元の整合性を確認する。
