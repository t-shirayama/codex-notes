# VS Codeで始めるCodex

> - 種別: official
> - 参考元: [Using Codex with your ChatGPT plan](https://help.openai.com/en/articles/11369540-codex-in-chatgpt), [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices), [Agent approvals & security](https://developers.openai.com/codex/agent-approvals-security)
> - 最終ファクトチェック: 2026-05-04
> - 確認メモ: VS Code利用開始、Reasoning Effort、approval policy と sandbox mode の関係を確認

VS CodeでCodexを初めて使う人向けの導入メモです。

## セットアップ

### 1. 拡張機能のインストール

VS Code の拡張機能マーケットプレイスで `Codex` を検索し、OpenAI が公開している IDE extension をインストールする。

### 2. サインイン

インストール後、Codex パネルから ChatGPT アカウントでサインインする。

> WindowsではWSL2があるとコマンド互換性の面で扱いやすい場面があります。ただし、これはこのリポジトリでの運用上の補足です。

## AGENTS.md の設定

`AGENTS.md` はCodexへの永続的な指示書です。プロジェクトの規約や完了条件を書いておくと、セッションをまたいでも運用を揃えやすくなります。

### 読み込まれる場所

| 場所 | 用途 |
| --- | --- |
| `~/.codex/AGENTS.md` | 全プロジェクト共通のグローバル設定 |
| リポジトリルートの `AGENTS.md` | プロジェクト全体の規約 |
| サブディレクトリの `AGENTS.md` | 特定機能・チーム向けの上書き設定 |

## 基本的な使い方

### モードの選択

| モード | できること | 向いている場面 |
| --- | --- | --- |
| **Chat** | 会話・相談のみ。ファイル操作なし | 設計の相談、コードレビューの依頼 |
| **Agent** | ファイルの読み書き・コマンド実行が可能。実行前に確認あり | 通常の開発作業 |
| **Agent (Full Access)** | 設定次第で確認を減らし、広い操作を許可できる | 信頼できるリポジトリでの限定された検証 |

`Agent (Full Access)` は「常に確認なしで何でも実行する」という意味ではありません。実際の確認有無やアクセス範囲は、`approval policy` と `sandbox mode` の組み合わせに依存します。最初は既定の権限から始め、信頼できるリポジトリや必要性が明確な作業だけ段階的に広げます。

### Reasoning Effort の調整

- **Low:** 範囲が明確な速いタスク
- **Medium:** ほとんどのタスクで十分
- **High:** 複雑な変更や大規模整理向け
- **Extra High:** 長時間・自律的・推論負荷の高い作業向け

## 最初に意識するとよいこと

- 対象ファイルを開いておく
- タスクは小さく具体的にする
- 複雑なら `/plan` を使う
- 権限を広げる前に、対象リポジトリと実行コマンドを確認する

## 具体例

`@src/app/page.tsx の見出し文言だけ直して。既存デザインは変えない。差分も説明して。` のように、対象と制約を一緒に渡すと安定しやすいです。

## 参考元

このページは以下の参考元に基づいて整理しています。未確認の推測は含めていません。

- [Using Codex with your ChatGPT plan](https://help.openai.com/en/articles/11369540-codex-in-chatgpt)
- [OpenAI Codex overview](https://openai.com/codex)
- [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)
- [Agent approvals & security](https://developers.openai.com/codex/agent-approvals-security)

## 関連記事

- [最初の1セッションの進め方](./first-session.md)
- [AGENTS.mdの運用方針](../operations/agents-md.md)
- [公式ベストプラクティス要約](../official/best-practices.md)
