# AGENTS.md

## Purpose

このリポジトリは、Codexを初心者から上級者まで使いこなすための日本語ナレッジベースです。
AIは「読みやすさ」「再利用しやすさ」「情報源の明確さ」を優先してください。

## Audience

- Codexをこれから試す人
- VS Code / CLI での運用を整えたい人
- `AGENTS.md`、`skills`、`hooks` の設計例を知りたい人
- 公式ドキュメントと実務知見を日本語で整理して読みたい人

## Source Priority

- 公式ドキュメント
- 実測や一次情報
- Qiita / Zenn / ブログ記事を再編集した知見

推測で断定しないこと。外部情報を要約するときは参考元を必ず残してください。

## Directory Roles

- `docs/getting-started/`: 初学者向けの導入
- `docs/official/`: 公式ドキュメントの日本語要約
- `docs/workflows/`: 実践フローと進め方
- `docs/best-practices/`: 実務で使いやすい運用原則
- `docs/operations/`: `AGENTS.md`、`skills`、`hooks` などの運用資産
- `docs/curation/`: Qiita / Zenn / ブログ知見の再編集メモ
- `docs/templates/`: 再利用用テンプレート
- `docs/alternatives/`: Codex以外の比較・代替案
- `.codex/hooks/`: リポジトリ共有のhooks置き場
- `.agents/skills/`: リポジトリ共有のskills置き場

## Writing Rules

- Markdownで書く
- 見出し構造を必ず使う
- 1ファイル = 1トピックを守る
- 冗長な前置きは書かない
- 具体例を必ず入れる
- URLだけは書かず、必ずMarkdownリンクにする
- 箇条書きだけで終わらせず、手順か判断基準も含める

良い例:

- 概要
- 使いどころ
- 手順
- 具体例

避ける例:

- 公式情報と個人意見が混ざっている
- 同じ論点を別ファイルに重複して書く
- 参考元がない

## Editing Rules

- 既存ファイルの更新を優先する
- 同じ内容の新規ファイルは作らない
- 大きなリネームや構造変更は、必要性が明確な場合だけ行う
- 目次を変えたら `docs/SUMMARY.md` か `README.md` を同時に更新する

## Review Checklist

- README / SUMMARY / article-registry のリンク整合性を確認したか
- 参考元がある記事は本文と記事台帳のファクトチェック日が一致しているか
- 新規記事は1ファイル1トピックになっているか
- 公式情報と外部記事の意見を混ぜていないか
- 完了済みの `PLAN.md` は `docs/archive/plans/` に移したか

## Summary Rules

- 公式要約には参考元を入れる
- 事実と解釈を分ける
- 翻訳ではなく「実務でどう使うか」が分かる形に整える

具体例:

- 悪い例: APIや機能名だけを並べる
- 良い例: 「いつ使うか」「何が楽になるか」を1段落で添える

## Skills And Hooks

- 同じ手順を2回以上繰り返すなら `skill` 候補
- 安全チェックや定型通知は `hook` 候補
- まだ安定していない手順は、先に `docs/operations/` に文書化する

追加するときは以下も揃えること:

- 目的
- 入力
- 出力
- 使う場面
- 最小例

## Templates

以下を優先して使うこと:

- `docs/templates/AGENTS.md`
- `docs/templates/PLANS.md`
- `docs/templates/context.json`
- `docs/templates/SKILL.md`
- `docs/templates/hook.py`
- `docs/templates/hook.ps1`

## Out Of Scope

- 実行コードの最適化
- 一般的なアプリケーション開発
- Codex運用と無関係な技術記事

## Goal

このリポジトリを読むだけで、Codexの導入、日常運用、知識の蓄積方法まで理解できる状態にする。
