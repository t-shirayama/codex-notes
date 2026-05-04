# AGENTS.mdの運用方針

> - 種別: official
> - 参考元: [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices), [Custom instructions with AGENTS.md](https://developers.openai.com/codex/guides/agents-md)
> - 最終ファクトチェック: 2026-05-04
> - 確認メモ: AGENTS.md の役割、AGENTS.override.md、階層ごとの読み込み順を確認

## 概要

`AGENTS.md` は、Codexに毎回守ってほしいルールを置くファイルです。プロンプトを短くしながら、一貫性を上げるために使います。

## 何を書くか

- 返答言語
- テストやレビューの必須条件
- 触ってよい範囲と禁止事項
- 目次更新やドキュメント運用のルール
- 公式情報と外部知見をどう分けて扱うか
- 裸URLを書かず、参考元をMarkdownリンクで残すルール

## 何を書かないか

- タスクごとに変わる一時的な前提
- 長い背景説明
- 同じ内容の繰り返し

## 更新の判断基準

- 同じ指示を2回以上書いた
- 同じ失敗を2回以上繰り返した
- レビューで毎回同じ指摘が出る

## 読み込み順と上書き

Codexは、グローバル設定から現在の作業ディレクトリに近い階層へ向かって、指示ファイルを順番に読み込みます。後から読み込まれる近い階層の指示ほど優先されるため、プロジェクト全体のルールはリポジトリルートに置き、特定領域だけのルールは対象ディレクトリの近くに置きます。

公式仕様では、各階層で `AGENTS.override.md` があれば `AGENTS.md` より優先されます。`AGENTS.override.md` は一時的な上書きや、特定チーム・特定サブディレクトリだけの例外を明確にしたいときに使います。

### 具体例

```txt
AGENTS.md
services/
  payments/
    AGENTS.override.md
```

この状態で `services/payments/` からCodexを起動すると、リポジトリルートの `AGENTS.md` を読んだあと、より近い `services/payments/AGENTS.override.md` の指示が後から入ります。payments配下だけテストコマンドやレビュー観点を変えたい場合に向いています。

既存の別名ファイルを指示ファイルとして扱いたい場合は、`project_doc_fallback_filenames` を設定できます。指示全体が大きくなる場合は、`project_doc_max_bytes` の上限も確認します。

## 最小構成

```markdown
# AGENTS.md

## Purpose

このリポジトリの目的を書く

## Writing Rules

- 1ファイル1トピック
- 具体例を入れる

## Editing Rules

- 既存ファイル更新を優先する
```

## 具体例

「目次を更新したら `docs/SUMMARY.md` も更新する」のようなルールは、口頭で毎回伝えるより `AGENTS.md` に固定した方がぶれません。

もう一歩進めるなら、「公式URLの要約は `docs/official/`、Qiita / Zenn の再編集は `docs/curation/` に置く」のように、保存先まで明文化すると迷いが減ります。

さらに運用を揃えるなら、記事を更新したときに本文の `最終ファクトチェック` と `docs/operations/article-registry.md` の両方を更新する、と書いておくと保守しやすくなります。

## 参考元

このページは以下の参考元に基づいて整理しています。未確認の推測は含めていません。

- [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)
- [Custom instructions with AGENTS.md](https://developers.openai.com/codex/guides/agents-md)
- [Using Codex with your ChatGPT plan](https://help.openai.com/en/articles/11369540-codex-in-chatgpt)
