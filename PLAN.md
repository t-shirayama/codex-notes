# PLAN.md

## Goal

`codex-memo-review.md` と再レビュー結果をもとに、修正済み項目を整理しつつ、未反映の記述・目次のズレ・記事台帳との不整合を解消する。
2026年5月時点の OpenAI Codex 公式情報に沿った、初見でも追いやすい日本語ナレッジベースに近づける。

## Source

- `codex-memo-review.md`
- [OpenAI Codex Docs](https://developers.openai.com/codex)
- [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)
- [OpenAI Codex AGENTS.md Guide](https://developers.openai.com/codex/guides/agents-md)
- [OpenAI Codex Hooks Guide](https://developers.openai.com/codex/hooks)
- [OpenAI Codex Review Guide](https://developers.openai.com/codex/app/review)

## Constraints

- 公式仕様と運用上の解釈を混ぜない。
- 既存ファイルの更新を優先し、同じ内容の新規記事は作らない。
- 参考元を差し替えた場合は、本文中の参考リンクも更新する。
- 初心者向けの記事では、詳細仕様を本文に詰め込みすぎず、補足として読める粒度にする。
- 目次や導線を変えた場合は、必要に応じて [docs/SUMMARY.md](./docs/SUMMARY.md) または [README.md](./README.md) も更新する。
- 記事台帳の `checked` は「確認日時点の記録」であり、本文と台帳メモに矛盾が出ないようにする。

## Current Status

前回レビューで指摘した主要項目のうち、`hooks.md`、`agents-md.md`、`best-practices.md`、`README.md` は概ね修正済み。
`vscode-codex.md`、記事台帳、SUMMARY、skill出力ルール、リンク整合性の残タスクまで反映済み。
以後は、公式情報の更新や新規記事追加時に本文・SUMMARY・記事台帳の同期を続ける。

## Tasks

### High Priority

- [x] [docs/getting-started/vscode-codex.md](./docs/getting-started/vscode-codex.md) の Reasoning Effort に `Extra High` を追加する。
  - `Low` / `Medium` / `High` / `Extra High` の4段階として整理する。
  - `Extra High` は「長時間・自律的・推論負荷の高い作業」に向く、という実務判断を添える。
  - 公式 Best Practices の表現と矛盾しないようにする。

- [x] [docs/getting-started/vscode-codex.md](./docs/getting-started/vscode-codex.md) の `Agent (Full Access)` 説明を弱める。
  - `Full Access = 常に確認なし` と読める表現を避ける。
  - 確認有無やアクセス範囲は `approval policy` と `sandbox mode` に依存する、と説明する。
  - 信頼できるリポジトリで段階的に広げる判断基準を添える。

- [x] [docs/operations/article-registry.md](./docs/operations/article-registry.md) の `VS Codeで始めるCodex` 行を本文と同期する。
  - `vscode-codex.md` を修正した場合は、確認メモを本文の実態に合わせて更新する。
  - 本文修正が後回しになる場合は、一時的に `needs-review` 扱いにすることを検討する。
  - `checked` が本文未反映の内容を保証しているように見えない状態にする。

- [x] [docs/SUMMARY.md](./docs/SUMMARY.md) を現在のREADME・記事台帳・実ファイル構成と同期する。
  - READMEに載っている主要記事へのリンクを反映する。
  - 古いパスや存在しないパスがあれば削除または修正する。
  - `Getting Started` / `Official` / `Operations` / `Curation` / `Templates` の分類をREADMEと揃える。

### Medium Priority

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

- [x] [docs/operations/agents-md.md](./docs/operations/agents-md.md) に `AGENTS.override.md` を補足する。
  - 公式仕様として存在することを脚注または補足欄で扱う。
  - 初心者向け本文の流れを崩さない粒度にする。

- [x] [docs/operations/agents-md.md](./docs/operations/agents-md.md) に「近い階層の指示が後から読み込まれる」点を補足する。
  - グローバル、リポジトリ、サブディレクトリの関係を短く整理する。
  - 具体例として、サブディレクトリ配下だけ別ルールを適用するケースを入れる。

- [x] [docs/official/best-practices.md](./docs/official/best-practices.md) に `/review` や diff レビューの導線を追加する。
  - 使う場面: PR前、広範囲変更後、レビュー観点を固定したいとき。
  - 「実装依頼」と「レビュー依頼」を分けると何が楽になるかを1段落で説明する。

- [x] [README.md](./README.md) に「このリポジトリは実行コードではなくドキュメント集」という一文を追加する。
  - 初見の人が、アプリケーションリポジトリではなくCodex運用メモだと分かる位置に置く。
  - 例: 冒頭説明または `何があるか` の前。

### Low Priority

- [x] [.agents/skills/url-to-markdown-summary/SKILL.md](./.agents/skills/url-to-markdown-summary/SKILL.md) の出力ルールを少し補強する。
  - 編集権限がない場合は、ファイルを直接更新せず差分案として提示する、と明記する。
  - 記事台帳を更新する場合も、本文側の修正内容と矛盾しないことを確認する。

- [x] 各記事冒頭の `種別: official / curation / operations` の扱いを整理する。
  - `official` と `operations` の境界が曖昧になりやすい記事を洗い出す。
  - すでに試験導入済みの場合は、READMEまたは記事台帳で分類方針を短く説明する。
  - 未導入の記事に無理に横展開しない。

- [x] リンク切れ・古いパス・READMEとSUMMARYの二重管理ズレを確認する。
  - READMEから辿れるリンクを確認する。
  - `docs/SUMMARY.md` から辿れるリンクを確認する。
  - 記事台帳にあるファイルが実在するか確認する。

## Acceptance Criteria

- `vscode-codex.md` に Reasoning Effort の `Extra High` が含まれている。
- `Agent (Full Access)` の説明が、`approval policy` と `sandbox mode` に依存する表現になっている。
- `article-registry.md` の `VS Codeで始めるCodex` 行が、本文の実態と矛盾していない。
- `docs/SUMMARY.md` が現在のREADME・記事台帳・実ファイル構成と概ね一致している。
- `hooks.md` の hooks 置き場と参考元が、公式の `Hooks - Codex` ページと矛盾しない。
- `agents-md.md` に `AGENTS.override.md` と階層ルールの補足がある。
- `best-practices.md` にレビュー用途の導線がある。
- READMEから、このリポジトリがCodex運用ドキュメント集であることが初見でも分かる。
- 変更した記事には、必要な参考元リンクがMarkdownリンクとして残っている。
- README、SUMMARY、記事台帳のリンクに明らかな不整合がない。

## Suggested Order

1. `vscode-codex.md` の Reasoning Effort と Full Access 表現を直す。
2. `article-registry.md` の VS Code記事メモを本文と同期する。
3. `docs/SUMMARY.md` をREADME・記事台帳・実ファイル構成と同期する。
4. `.agents/skills/url-to-markdown-summary/SKILL.md` の出力ルールを必要に応じて補強する。
5. README、SUMMARY、記事台帳、本文中のリンクと参考元の整合性を確認する。
