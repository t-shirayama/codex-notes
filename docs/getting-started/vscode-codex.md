# VS Codeで始めるCodex

> - 種別: official
> - 参考元: [Codex IDE extension settings](https://developers.openai.com/codex/ide/settings), [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices), [Sandbox](https://developers.openai.com/codex/concepts/sandboxing), [Configuration Reference](https://developers.openai.com/codex/config-reference), [Using Codex with your ChatGPT plan](https://help.openai.com/en/articles/11369540-codex-in-chatgpt)
> - 最終ファクトチェック: 2026-05-23
> - 確認メモ: IDE extension が Codex CLI と設定を共有する点、Windows WSL設定、sandbox / approval の現行説明を確認

VS CodeでCodexを初めて使う人向けの導入メモです。

## セットアップ

### 1. 拡張機能のインストール

VS Code の拡張機能マーケットプレイスで `Codex` を検索し、OpenAI が公開している IDE extension をインストールする。

### 2. サインイン

インストール後、Codex パネルから ChatGPT アカウントでサインインする。

Codex IDE extension は内部的に Codex CLI を使います。デフォルトモデル、approval、sandbox などの実行設定は、エディタ設定ではなく共通の `~/.codex/config.toml` で管理します。

Windowsでは、リポジトリや開発ツールがWSL2側にあるなら、IDE設定の `chatgpt.runCodexInWindowsSubsystemForLinux` を使ってWSLでCodexを動かす選択肢があります。Windowsネイティブで使う場合も、CodexのWindows sandbox設定を前提に権限を調整します。

## AGENTS.md の設定

`AGENTS.md` はCodexへの永続的な指示書です。プロジェクトの規約や完了条件を書いておくと、セッションをまたいでも運用を揃えやすくなります。

### 読み込まれる場所

| 場所 | 用途 |
| --- | --- |
| `~/.codex/AGENTS.md` | 全プロジェクト共通のグローバル設定 |
| リポジトリルートの `AGENTS.md` | プロジェクト全体の規約 |
| サブディレクトリの `AGENTS.md` | 特定機能・チーム向けの上書き設定 |

## 基本的な使い方

### モードと権限の考え方

| モード | できること | 向いている場面 |
| --- | --- | --- |
| **Chat** | 会話・相談のみ。ファイル操作なし | 設計の相談、コードレビューの依頼 |
| **Agent** | ファイルの読み書き・コマンド実行が可能。実行前に確認あり | 通常の開発作業 |
| **Full access相当の設定** | sandbox制限と承認確認を大きく緩める | 信頼できるリポジトリで、必要性が明確な限定作業 |

権限はUI上の名前だけで判断せず、`sandbox_mode` と `approval_policy` の組み合わせで考えます。公式ドキュメントでは、full access は `sandbox_mode = "danger-full-access"` と `approval_policy = "never"` の組み合わせとして説明されています。

日常作業では、まず `sandbox_mode = "workspace-write"` と `approval_policy = "on-request"` のような低リスクな設定から始めます。複数ディレクトリに書き込みたい場合は、sandboxを外す前に writable roots や承認ルールで範囲を広げる方が安全です。

### Reasoning Effort の調整

- **Low:** 範囲が明確な速いタスク
- **Medium:** ほとんどのタスクで十分
- **High:** 複雑な変更や大規模整理向け
- **Extra High / xhigh:** 長時間・自律的・推論負荷の高い作業向け

## 最初に意識するとよいこと

- 対象ファイルを開いておく
- タスクは小さく具体的にする
- 複雑なら `/plan` を使う
- 権限を広げる前に、対象リポジトリ、実行コマンド、書き込み範囲を確認する

## 具体例

`@src/app/page.tsx の見出し文言だけ直して。既存デザインは変えない。差分も説明して。` のように、対象と制約を一緒に渡すと安定しやすいです。

## 参考元

このページは以下の参考元に基づいて整理しています。未確認の推測は含めていません。

- [Codex IDE extension settings](https://developers.openai.com/codex/ide/settings)
- [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)
- [Sandbox](https://developers.openai.com/codex/concepts/sandboxing)
- [Configuration Reference](https://developers.openai.com/codex/config-reference)
- [Using Codex with your ChatGPT plan](https://help.openai.com/en/articles/11369540-codex-in-chatgpt)

## 関連記事

- [最初の1セッションの進め方](./first-session.md)
- [AGENTS.mdの運用方針](../operations/agents-md.md)
- [Codex運用の重要ポイント](../curation/codex運用の重要ポイント.md)
