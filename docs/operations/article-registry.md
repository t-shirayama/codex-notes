# 記事台帳

## 概要

この台帳では、参考元を持つ主要記事について、参考元と最終ファクトチェック日を記事ごとに管理します。
このリポジトリでは、参考元のある内容だけを残し、未確認の推測は断定しない方針で管理します。

## ステータスの意味

- `checked`: 現時点の参考元と照合済み
- `needs-review`: 参考元更新や本文見直しの可能性がある
- `draft`: 下書き段階

`checked` は恒久的な正確性保証ではなく、記録日時点で参考元を確認したことを意味します。

## Articles

| 記事タイトル | パス | 種別 | 参考元 | 最終ファクトチェック日 | ステータス | メモ |
| --- | --- | --- | --- | --- | --- | --- |
| 公式ベストプラクティス要約 | `docs/official/best-practices.md` | `official` | [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)<br>[Review - Codex app](https://developers.openai.com/codex/app/review) | `2026-05-04` | `checked` | `/review` と diff レビューの導線を追加 |
| VS Codeで始めるCodex | `docs/getting-started/vscode-codex.md` | `official` | [Using Codex with your ChatGPT plan](https://help.openai.com/en/articles/11369540-codex-in-chatgpt)<br>[OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)<br>[Agent approvals & security](https://developers.openai.com/codex/agent-approvals-security) | `2026-05-04` | `checked` | Extra High と approval policy / sandbox mode の関係を反映 |
| AGENTS / config / skills / hooks の役割 | `docs/official/agents-config-skills-hooks.md` | `official` | [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)<br>[Using Codex with your ChatGPT plan](https://help.openai.com/en/articles/11369540-codex-in-chatgpt) | `2026-05-04` | `checked` | 参考元ベースの運用解説として整理 |
| Webアプリ開発スターター | `docs/workflows/web-app-codex-starter.md` | `operations` | [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)<br>[Custom instructions with AGENTS.md](https://developers.openai.com/codex/guides/agents-md)<br>[Using Codex with your ChatGPT plan](https://help.openai.com/en/articles/11369540-codex-in-chatgpt)<br>[OpenAI Codex CLI - Getting Started](https://help.openai.com/en/articles/11096431-openai-codex-cli-getting-started) | `2026-05-04` | `checked` | 公式要約ではなく、新規Webアプリ開発前に揃える運用資産とテンプレート例として整理 |
| AGENTS.mdの運用方針 | `docs/operations/agents-md.md` | `official` | [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)<br>[Custom instructions with AGENTS.md](https://developers.openai.com/codex/guides/agents-md) | `2026-05-04` | `checked` | AGENTS.override.md と階層ごとの後勝ちルールを反映 |
| hooksの運用方針 | `docs/operations/hooks.md` | `official` | [Hooks - Codex](https://developers.openai.com/codex/hooks) | `2026-05-04` | `checked` | hooks.json / config.toml、feature flag、スクリプト置き場の違いを反映 |
| MCPの運用方針 | `docs/operations/mcp.md` | `official` | [Model Context Protocol - Codex](https://developers.openai.com/codex/mcp)<br>[Docs MCP](https://developers.openai.com/learn/docs-mcp) | `2026-05-04` | `checked` | OpenAI Docs MCP の追加手順と設定保存先を整理 |
| skills作成ガイド | `docs/operations/skill-authoring.md` | `official` | [Agent Skills - Codex](https://developers.openai.com/codex/skills)<br>[OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)<br>[Using Codex with your ChatGPT plan](https://help.openai.com/en/articles/11369540-codex-in-chatgpt) | `2026-05-04` | `checked` | skillの作成、発火設計、保守観点を追加 |
| AGENTS.md設計パターン集 | `docs/curation/agents-md-patterns.md` | `curation` | [What is AGENTS.md?](https://zenn.dev/redamoon/articles/article27-agents)<br>[CodexのAGENTS.md超徹底解説](https://zenn.dev/unikoukokun/articles/333be4765ec62a) | `2026-05-04` | `checked` | 参考元を追加し、要点と記述パターンを照合 |
| Codex運用の重要ポイント | `docs/curation/codex運用の重要ポイント.md` | `curation` | [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)<br>[OpenAI による Codex の使用方法](https://openai.com/ja-JP/business/guides-and-resources/how-openai-uses-codex/)<br>[Codex を完全に理解する会](https://zenn.dev/microsoft/articles/codex_fully_understood)<br>[人間は意図、AIは実装：Codexが導く「要件を伝えるだけ」のAI駆動開発ワークフロー](https://developers.cyberagent.co.jp/blog/archives/62010/)<br>[CodexのBestPracticeを学ぶ会](https://zenn.dev/microsoft/articles/codex_best_practice) | `2026-05-23` | `checked` | 公式情報を軸に、OpenAI活用事例と外部解説を運用観点で再構成 |
| 複数エージェント運用メモ | `docs/curation/multi-agent-workflows.md` | `curation` | [Codex のマルチエージェント機能を Claude Code と徹底比較する](https://zenn.dev/zenchaine/articles/codex-multi-agent-vs-claude-code)<br>[Codex CLIでもマルチエージェント(subagent)機能が利用可能になった](https://qiita.com/syonon/items/b75a50bf81cb723fda1c) | `2026-05-04` | `checked` | 参考元を追加し、並列分担の要点を確認 |

## 更新ルール

- 記事を新規作成したら、この台帳にも1行追加する
- 記事の参考元を見直したら、本文の `最終ファクトチェック` とこの台帳の両方を更新する
- 複数参考元がある場合は、同じセル内で改行または箇条書きで残してよい
- 変更がない場合も `最終ファクトチェック日` とメモは更新してよい

## 再確認の目安

- `official`: 月1回、または公式ドキュメント更新時
- `curation`: 3か月に1回、または参照記事の前提が変わったとき
- `hooks` / `MCP` / `skills`: 仕様変更や新しい公式ページが出たら即時

再確認時は本文だけでなく、冒頭の `最終ファクトチェック`、`確認メモ`、この台帳の `最終ファクトチェック日` と `メモ` も同時に見直します。

## 種別の使い分け

- `official`: 公式ドキュメントを主な根拠にした要約や運用メモ
- `curation`: Qiita / Zenn / ブログ記事などの外部知見を再編集したメモ
- `operations`: このリポジトリ固有の運用ルールや作業手順

現時点では、`docs/operations/` 配下でも公式ドキュメントを主根拠にしている記事は `official` として扱います。保存先のディレクトリと種別は必ずしも一致させず、本文冒頭の `種別` とこの記事台帳で根拠を明示します。

## 参考元

- [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)
