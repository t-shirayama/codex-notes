# Codex仕様リファレンス

> - 最終確認: 2026-05-30
> - 位置づけ: 公式仕様や確認先を短く見るためのメモ

## VS Code / CLI

Codex IDE extension は、Codex CLI と設定を共有します。VS Codeで使う場合も、モデル、approval、sandbox、MCPなどはCLI側の考え方で理解します。

確認すること:

- IDE extension を入れてサインインできているか
- 作業ディレクトリが意図したリポジトリか
- sandbox と approval の設定が作業の危険度に合っているか
- Windowsでは WSL で動かすか、Windows native のsandbox前提で使うか

主な参照先:

- [Codex IDE extension settings](https://developers.openai.com/codex/ide/settings)
- [Codex CLI](https://developers.openai.com/codex/cli)
- [Sandbox](https://developers.openai.com/codex/concepts/sandboxing)
- [Configuration Reference](https://developers.openai.com/codex/config-reference)

## AGENTS.md

`AGENTS.md` は、Codexに読ませる永続指示です。リポジトリの目的、編集ルール、情報源の優先順位、確認方法のような恒久ルールを置きます。

確認すること:

- 毎回守るルールだけを書いているか
- 一時的な背景説明を入れていないか
- 下位ディレクトリの上書きが必要か
- ルールが長すぎる場合、本文記事へ逃がせるか

主な参照先:

- [Custom instructions with AGENTS.md](https://developers.openai.com/codex/guides/agents-md)
- [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)

## MCP

MCPは、Codexに外部ツールや外部コンテキストを渡す仕組みです。公式ドキュメント、Issue、ログ、外部サービスなど、手貼りしたくない情報を扱うときに使います。

OpenAI Docs MCP の追加例:

```sh
codex mcp add openaiDeveloperDocs --url https://developers.openai.com/mcp
codex mcp list
```

確認すること:

- 個人環境に置く設定か、プロジェクトで共有する手順か
- 認証情報やトークンを含まないか
- CLIとIDE拡張の両方で同じ設定を使う必要があるか

主な参照先:

- [Model Context Protocol - Codex](https://developers.openai.com/codex/mcp)
- [Docs MCP](https://developers.openai.com/learn/docs-mcp)

## skills

skillは、会話から呼び出す再利用手順です。Codexはまずskill名、description、パスを見て、必要なときに本文を読みます。descriptionには、使う場面、入力、出力を具体的に書きます。

確認すること:

- 同じ依頼を2回以上繰り返しているか
- 入力と出力を固定できるか
- `AGENTS.md` に置く恒久ルールと混ざっていないか
- 自動実行すべきhookと混ざっていないか

主な参照先:

- [Agent Skills - Codex](https://developers.openai.com/codex/skills)
- [Using Codex with your ChatGPT plan](https://help.openai.com/en/articles/11369540-codex-in-chatgpt)

## hooks

hookは、Codexのライフサイクル中に決定的なスクリプトを実行する仕組みです。危険操作の確認、ログ整形、定型通知などに向いています。

確認すること:

- 人間の判断が必要な承認をhookに任せていないか
- 失敗時の影響が大きい自動変更をさせていないか
- 非管理hookの信頼レビューが必要な前提を理解しているか
- hook同士の実行順に依存していないか

主な参照先:

- [Hooks - Codex](https://developers.openai.com/codex/hooks)

## slash commands

Codex CLIでは、作業の節目でスラッシュコマンドを使います。すべて覚えるより、状態確認、権限確認、計画、差分、レビュー、圧縮を先に覚えます。

よく使うもの:

- `/status`: モデル、権限、作業状態を見る
- `/permissions`: 承認モードを確認・変更する
- `/plan`: 実装前に計画へ切り替える
- `/diff`: Git差分を見る
- `/review`: working treeをレビューする
- `/compact`: 長い会話を圧縮する
- `/mcp`: MCP toolsを確認する
- `/skills`: 利用できるskillを確認する
- `/hooks`: hookの状態を確認する

主な参照先:

- [Slash commands in Codex CLI](https://developers.openai.com/codex/cli/slash-commands)
