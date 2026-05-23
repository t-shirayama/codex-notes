# skillsの運用方針

> - 種別: official
> - 参考元: [Agent Skills - Codex](https://developers.openai.com/codex/skills), [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices), [Using Codex with your ChatGPT plan](https://help.openai.com/en/articles/11369540-codex-in-chatgpt)
> - 最終ファクトチェック: 2026-05-23
> - 確認メモ: skillの探索場所、progressive disclosure、pluginとの役割分担を確認

## 概要

`skill` は、繰り返し使う手順を再利用可能な形にしたものです。公式ドキュメントでは、skill は再利用ワークフローの authoring format、plugin は配布単位として説明されています。このリポジトリでも「毎回同じ説明を繰り返す作業」を外出しする手段として使います。

Codexは最初から全skill本文を読むのではなく、まずskill名、description、ファイルパスだけを見て、必要になったときに `SKILL.md` 本文を読みます。そのため、`description` には「いつ使うか」「いつ使わないか」を短く具体的に書きます。

このページは入口です。実際に設計するときは [skills作成ガイド](./skill-authoring.md) をあわせて見てください。

## 何に向いているか

- 同じ依頼を何度も繰り返す作業
- 入力と出力がある程度固定されている作業
- 手順を明文化すると品質が安定する作業
- 実行者が変わっても同じ流れで再利用したい作業

## 何に向いていないか

- 手順が毎回大きく変わる作業
- 人の判断や承認が中心になる作業
- リポジトリ全体の恒久ルールそのもの
- 自動実行されるべき安全チェック

恒久ルールは `AGENTS.md`、定型チェックは `hooks`、配布単位としてまとめたいものは `plugin` を優先します。

## このリポジトリでの基本方針

1. まず文書で手順を安定させる
2. 入力、出力、判断基準を短く固定する
3. 1 skill = 1業務に絞る
4. 実例で試してから共有skillにする
5. 追加後は関連ドキュメントも更新する

## 置き場

- リポジトリ共有: `.agents/skills/`
- 個人用: `$HOME/.agents/skills`
- 管理者用: `/etc/codex/skills`
- システム同梱: Codexに最初から含まれるskill
- テンプレート: `docs/templates/SKILL.md`
- 詳細ガイド: `docs/operations/skill-authoring.md`

リポジトリ内では、Codexを起動した作業ディレクトリからリポジトリルートまでの `.agents/skills` が探索対象になります。複数人に配布したい、または複数skillやアプリ連携をまとめたい場合は、skillフォルダを直接共有するよりplugin化を検討します。

## 最低限そろえる項目

- YAML front matter の `name`
- YAML front matter の `description`
- `Purpose`
- `Trigger`
- `Inputs`
- `Outputs`
- `Steps`
- `Example`

`description` と `Trigger` は特に重要です。`description` は Codex が暗黙的に skill を選ぶ判断材料になるため、使う場面と使わない場面を短く具体的に書きます。

## 追加フロー

1. 繰り返し作業を見つける
2. 先に `docs/operations/` などで手順を文章化する
3. `docs/templates/SKILL.md` をベースに skill 化する
4. `.agents/skills/<skill-name>/` に配置する
5. `README.md` と `docs/SUMMARY.md` の導線を更新する
6. 必要なら `docs/operations/article-registry.md` も更新する

## このリポジトリで使える具体例

- `.agents/skills/url-to-markdown-summary/`

この skill は、公式URLやQiita / ZennのURLを受け取り、そのまま `docs/official/` や `docs/curation/` に保存しやすいMarkdown記事として出力するためのものです。

### 使いどころ

- OpenAI公式ドキュメントを日本語で整理したい
- QiitaやZennの知見をテーマ単位で再編集したい
- URLを渡したら最初から保存用の本文を出したい
- 既存記事を参考元で再確認し、ファクトチェック日も更新したい

### ファクトチェック用途

この skill は記事作成だけでなく、既存記事の再確認にも使えます。

- 記事本文を参考元と照合する
- `最終ファクトチェック` を更新する
- `docs/operations/article-registry.md` のメモも更新する

## 判断に迷ったときの目安

- 毎回守るルールなら `AGENTS.md`
- 会話から呼び出したい再利用手順なら `skill`
- 実行前後に機械的に走らせたいなら `hook`
- 複数のskillや連携設定を配布したいなら `plugin`

## 具体例

毎回「参考元、要点、実務での意味、短い例」を揃えて公式要約を書いているなら、その手順は `skill` 候補です。逆に「常に日本語で答える」「変更後はテストを提案する」のような恒久ルールは `AGENTS.md` 向きです。

## 次に読むページ

- [skills作成ガイド](./skill-authoring.md)
- [SKILL.mdテンプレート](../templates/SKILL.md)
- [AGENTS.mdの運用方針](./agents-md.md)
- [hooksの運用方針](./hooks.md)

## 参考元

このページは以下の参考元に基づいて整理しています。未確認の推測は含めていません。

- [Agent Skills - Codex](https://developers.openai.com/codex/skills)
- [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)
- [Using Codex with your ChatGPT plan](https://help.openai.com/en/articles/11369540-codex-in-chatgpt)
