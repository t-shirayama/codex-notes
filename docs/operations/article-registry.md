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
| 公式ベストプラクティス要約 | `docs/official/best-practices.md` | `official` | [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)<br>[Review - Codex app](https://developers.openai.com/codex/app/review) | `2026-05-08` | `checked` | 主要論点と `/review` 導線を再確認 |
| VS Codeで始めるCodex | `docs/getting-started/vscode-codex.md` | `official` | [Using Codex with your ChatGPT plan](https://help.openai.com/en/articles/11369540-codex-in-chatgpt)<br>[Codex IDE extension](https://developers.openai.com/codex/ide)<br>[Codex IDE extension features](https://developers.openai.com/codex/ide/features)<br>[OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)<br>[Agent approvals & security](https://developers.openai.com/codex/agent-approvals-security) | `2026-05-08` | `checked` | IDE extension の Reasoning Effort 表記を公式ページに合わせて修正 |
| 最初の1セッションの進め方 | `docs/getting-started/first-session.md` | `official` | [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)<br>[OpenAI Prompting guide](https://developers.openai.com/api/docs/guides/prompting) | `2026-05-08` | `checked` | 1タスク1スレッド、計画先行、プロンプト要素を確認 |
| AGENTS / config / skills / hooks の役割 | `docs/official/agents-config-skills-hooks.md` | `official` | [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)<br>[Using Codex with your ChatGPT plan](https://help.openai.com/en/articles/11369540-codex-in-chatgpt) | `2026-05-08` | `checked` | 参考元ベースの運用解説として再確認 |
| Webアプリ開発スターター | `docs/workflows/web-app-codex-starter.md` | `operations` | [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)<br>[Custom instructions with AGENTS.md](https://developers.openai.com/codex/guides/agents-md)<br>[Using Codex with your ChatGPT plan](https://help.openai.com/en/articles/11369540-codex-in-chatgpt)<br>[Codex CLI](https://developers.openai.com/codex/cli) | `2026-05-08` | `checked` | `examples/` 削除に合わせて構成例を本文へ集約し、CLIリンクを現行URLへ更新 |
| AGENTS.mdの運用方針 | `docs/operations/agents-md.md` | `official` | [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)<br>[Custom instructions with AGENTS.md](https://developers.openai.com/codex/guides/agents-md) | `2026-05-08` | `checked` | AGENTS.override.md と階層ごとの後勝ちルールを再確認 |
| Codex開発ルールチェックリスト | `docs/best-practices/development-rules.md` | `operations` | [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)<br>[Custom instructions with AGENTS.md](https://developers.openai.com/codex/guides/agents-md)<br>1週間の利用メモ | `2026-05-08` | `checked` | AGENTS.md に入れる開発ルール例として再確認 |
| プロンプト設計の基本 | `docs/best-practices/prompt-design.md` | `official` | [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)<br>[OpenAI Prompting guide](https://developers.openai.com/api/docs/guides/prompting)<br>[OpenAI Prompt engineering guide](https://developers.openai.com/api/docs/guides/prompt-engineering) | `2026-05-08` | `checked` | 古いPrompt engineering URLを現行URLへ更新 |
| hooksの運用方針 | `docs/operations/hooks.md` | `official` | [Hooks - Codex](https://developers.openai.com/codex/hooks) | `2026-05-08` | `checked` | hooks.json / config.toml、feature flag、スクリプト置き場の違いを再確認 |
| MCPの運用方針 | `docs/operations/mcp.md` | `official` | [Model Context Protocol - Codex](https://developers.openai.com/codex/mcp)<br>[Docs MCP](https://developers.openai.com/learn/docs-mcp) | `2026-05-08` | `checked` | OpenAI Docs MCP の追加手順と設定保存先を再確認 |
| skillsの運用方針 | `docs/operations/skills.md` | `official` | [Agent Skills - Codex](https://developers.openai.com/codex/skills)<br>[OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)<br>[Using Codex with your ChatGPT plan](https://help.openai.com/en/articles/11369540-codex-in-chatgpt) | `2026-05-08` | `checked` | 作成ガイドを統合し、skill関連の入口を1ページに集約 |
| AI駆動開発ワークフロー概要 | `docs/workflows/ai-driven-development.md` | `curation` | [CyberAgent Developers Blog](https://developers.cyberagent.co.jp/blog/archives/62010/) | `2026-05-08` | `checked` | 元記事のフェーズ構成と、このリポジトリ向けの整理方針を確認 |
| AGENTS.md設計パターン集 | `docs/curation/agents-md-patterns.md` | `curation` | [What is AGENTS.md?](https://zenn.dev/redamoon/articles/article27-agents)<br>[CodexのAGENTS.md超徹底解説](https://zenn.dev/unikoukokun/articles/333be4765ec62a)<br>[Custom instructions with AGENTS.md](https://developers.openai.com/codex/guides/agents-md) | `2026-05-08` | `checked` | 外部記事の実践知見と公式AGENTS.mdページを照合 |
| 複数エージェント運用メモ | `docs/curation/multi-agent-workflows.md` | `curation` | [Codex のマルチエージェント機能を Claude Code と徹底比較する](https://zenn.dev/zenchaine/articles/codex-multi-agent-vs-claude-code)<br>[Codex CLIでもマルチエージェント(subagent)機能が利用可能になった](https://qiita.com/syonon/items/b75a50bf81cb723fda1c)<br>[Subagents - Codex](https://developers.openai.com/codex/concepts/subagents) | `2026-05-08` | `checked` | 現行公式ドキュメントの「明示依頼が必要」という条件を追記 |
| Gemini API × Aiderで始めるAIコーディング環境 | `docs/alternatives/gemini-api-aider.md` | `curation` | [Google AI Studio](https://aistudio.google.com)<br>[Run Gemma with the Gemini API](https://ai.google.dev/gemma/docs/core/gemma_on_gemini_api)<br>[Gemini API Rate Limits](https://ai.google.dev/gemini-api/docs/rate-limits)<br>[Aider Installation](https://aider.chat/docs/install.html)<br>[Aider Gemini](https://aider.chat/docs/llms/gemini.html) | `2026-05-08` | `checked` | Aiderの現行インストール手順とGemini/Gemmaモデル指定を確認 |

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
