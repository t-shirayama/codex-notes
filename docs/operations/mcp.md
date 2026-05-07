# MCPの運用方針

> - 種別: official
> - 参考元: [Model Context Protocol - Codex](https://developers.openai.com/codex/mcp), [Docs MCP](https://developers.openai.com/learn/docs-mcp)
> - 最終ファクトチェック: 2026-05-04
> - 確認メモ: OpenAI Docs MCP のURL、追加コマンド、設定ファイルの置き場所を確認

## 概要

MCPは、Codexに外部ツールや外部コンテキストを渡すための仕組みです。公式ドキュメントでは、Codex CLIとIDE拡張の両方でMCPサーバーを使えると説明されています。

このリポジトリでは、OpenAIやCodexの公式情報を参照するときは OpenAI Docs MCP を優先します。最新情報を毎回Web検索や手動コピーに頼るより、公式ドキュメントを直接検索できる状態にしておく方が、記事のファクトチェックや更新作業が安定します。

## OpenAI Docs MCP

OpenAI Docs MCP は、OpenAI developer docs を検索・閲覧するための読み取り専用MCPです。OpenAI APIを代わりに呼び出すものではなく、ドキュメント確認用として使います。

### 追加コマンド

```sh
codex mcp add openaiDeveloperDocs --url https://developers.openai.com/mcp
```

### 確認コマンド

```sh
codex mcp list
```

`openaiDeveloperDocs` が `enabled` と表示されれば追加済みです。追加後にツールが見えない場合は、Codexを再起動します。

## 設定ファイルの置き場所

`codex mcp add` で追加したMCP設定は、通常はユーザー設定の `~/.codex/config.toml` に保存されます。

```toml
[mcp_servers.openaiDeveloperDocs]
url = "https://developers.openai.com/mcp"
```

公式ドキュメントでは、MCP設定は既定で `~/.codex/config.toml` に保存され、信頼済みプロジェクトでは `.codex/config.toml` にプロジェクト単位で置くこともできると説明されています。

## このリポジトリでの判断基準

### ユーザー設定に置く

- 個人の環境で使うMCP
- 認証情報やトークンに関係するMCP
- CLIとIDE拡張の両方で同じ設定を使いたいMCP

OpenAI Docs MCP は公開ドキュメント用で秘密情報を含まないため、このリポジトリでは `.codex/config.toml` に共有設定として置いています。個人環境だけで使うMCPや、認証情報を伴うMCPは `~/.codex/config.toml` に置きます。

### リポジトリには手順を残す

- チーム全員に同じ導入手順を共有したい
- 設定の意味や確認方法を残したい
- 公式ドキュメント要約のファクトチェック手順に組み込みたい

このリポジトリでは、OpenAI公式情報の確認を安定させるため、OpenAI Docs MCP の実設定も `.codex/config.toml` に置きます。その他のMCPを追加する場合は、プロジェクト全員が同じMCPを使う必要があり、かつ秘密情報を含まない場合に限ります。

## 具体例

OpenAI公式ドキュメントを確認しながら記事を更新する場合は、次のように依頼します。

```txt
OpenAI Docs MCPを使って、Codex Skillsの公式ドキュメントを確認して。
docs/operations/skills.md の内容が古ければ修正して。
```

この依頼では、CodexはWeb検索より先に OpenAI Docs MCP で公式ドキュメントを確認します。確認後は、本文の `最終ファクトチェック` と `確認メモ` も更新対象にします。

## 参考元

このページは以下の参考元に基づいて整理しています。未確認の推測は含めていません。

- [Model Context Protocol - Codex](https://developers.openai.com/codex/mcp)
- [Docs MCP](https://developers.openai.com/learn/docs-mcp)
