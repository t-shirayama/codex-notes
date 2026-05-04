# skillsの運用方針

> 種別: official
> 参考元: [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)
> 最終ファクトチェック: 2026-05-04
> 確認メモ: skills の再利用方針とこのリポジトリの運用設計を整理

## 概要

`skill` は、繰り返し使う手順を再利用可能な形にしたものです。このリポジトリでは、まず文書で手順を安定させてから `skill` 化します。

## 追加する基準

- 同じ手順を2回以上繰り返している
- 入力と出力がある程度固定されている
- 実行者が変わっても再利用したい

## まだ追加しない基準

- 手順が毎回変わる
- 判断が多く、テンプレート化すると逆に読みにくい
- まだ試行段階

## 置き場

- 共有用: `.agents/skills/`
- テンプレート: `docs/templates/SKILL.md`

## 候補例

- 公式ドキュメント要約作成
- PRレビュー観点の整理
- リリースノートの下書き生成

## このリポジトリで使える具体例

- `.agents/skills/url-to-markdown-summary/`

このskillは、公式URLやQiita / ZennのURLを受け取り、そのまま `docs/official/` や `docs/curation/` に保存しやすいMarkdown記事として出力するためのものです。

### 使いどころ

- OpenAI公式ドキュメントを日本語で整理したい
- QiitaやZennの知見をテーマ単位で再編集したい
- URLを渡したら最初から保存用の本文を出したい
- 既存記事を参考元で再確認し、ファクトチェック日も更新したい

### ファクトチェック用途

このskillは記事作成だけでなく、既存記事の再確認にも使えます。

- 記事本文を参考元と照合する
- `最終ファクトチェック` を更新する
- `docs/operations/article-registry.md` のメモも更新する

## 具体例

毎回「参考元、要点、実務での意味、短い例」を揃えて公式要約を書いているなら、その手順は `skill` 候補です。

## 参考元

このページは以下の参考元に基づいて整理しています。未確認の推測は含めていません。

- https://developers.openai.com/codex/learn/best-practices
- https://help.openai.com/en/articles/11369540-codex-in-chatgpt
