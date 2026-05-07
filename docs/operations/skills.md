# skillsの運用方針

> - 種別: official
> - 参考元: [Agent Skills - Codex](https://developers.openai.com/codex/skills), [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices), [Using Codex with your ChatGPT plan](https://help.openai.com/en/articles/11369540-codex-in-chatgpt)
> - 最終ファクトチェック: 2026-05-08
> - 確認メモ: 旧作成ガイドの内容を統合し、運用方針と作成手順を1ページに集約

## 概要

`skill` は、繰り返し使う手順を再利用可能な形にしたものです。OpenAIの案内では、再利用できるワークフローとして扱われており、このリポジトリでも「毎回同じ説明を繰り返す作業」を外出しする手段として使います。

このページでは、追加基準、作成手順、保守方法までを1つにまとめます。細かい作成ルールを別記事に分けすぎると参照先が散るため、skill関連の判断はまずこのページを見ます。

## 役割分担

- `AGENTS.md`: 毎回守ってほしい恒久ルール
- `skill`: 会話から呼び出したい再利用手順
- `hook`: 実行前後の定型チェックや補助処理
- `plugin`: 複数skillや連携設定をまとめて配布する単位

恒久ルールを skill に入れると、必要な場面でしか読まれません。反対に、特定の作業だけで使う長い手順を `AGENTS.md` に入れると、毎回のコンテキストが重くなります。

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

## 追加する判断基準

次の条件がそろったら skill 化を検討します。

- 同じ依頼を2回以上繰り返している
- 入力が定型化できる
- 出力の品質基準を文章で説明できる
- 手順を固定すると早くなる
- 他の人にも再利用してほしい

## 置き場

- 共有用: `.agents/skills/`
- テンプレート: `docs/templates/SKILL.md`

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

## 作成フロー

1. 繰り返し作業を見つける
2. 先に `docs/operations/` などで手順を文章化する
3. 入力、出力、対象外を固定する
4. `docs/templates/SKILL.md` をベースに `SKILL.md` を作る
5. `.agents/skills/<skill-name>/` に配置する
6. 実例で1回以上試す
7. `README.md` と `docs/SUMMARY.md` の導線を更新する
8. 参考元を持つ記事作成系なら `docs/operations/article-registry.md` も更新する

いきなり skill にせず、まず文章で手順を安定させます。3回くらい同じ流れで使えたら、skill に切り出しやすくなります。

## 書き方のコツ

### 1 skill = 1業務に絞る

要約、翻訳、レビュー、公開準備までを1つに詰め込むと、発火条件も出力品質もぶれやすくなります。たとえば「公式URLを保存用Markdown記事にする」と「既存記事をファクトチェックする」は近い作業ですが、更新対象が違うなら手順を分けるか、Steps内で明確に分岐させます。

### Trigger を自然文で書く

skill名を明示した依頼だけでなく、自然文でも使いどころが伝わるようにします。

悪い例:

- URLを処理する

良い例:

- OpenAI公式URLやQiita / ZennのURLを受け取り、保存用Markdown記事にまとめるとき
- 既存記事を参考元URLで再確認し、本文とファクトチェック日を更新するとき

### Steps は命令形で書く

読む人が手順を追える形にします。

1. URLの種類を判定する
2. 参考元の優先順位を決める
3. 出力テンプレートを選ぶ
4. 本文を構成する
5. 保存先と更新対象を提案する

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

## よいskillと悪いskill

よい skill は、入力、出力、手順、参考元、更新対象が明確です。悪い skill は、複数業務をまとめすぎていたり、`AGENTS.md` や `hook` と役割が重複していたり、Example がなく使いどころが読めなかったりします。

## 判断に迷ったときの目安

- 毎回守るルールなら `AGENTS.md`
- 会話から呼び出したい再利用手順なら `skill`
- 実行前後に機械的に走らせたいなら `hook`
- 複数のskillや連携設定を配布したいなら `plugin`

## 具体例

毎回「参考元、要点、実務での意味、短い例」を揃えて公式要約を書いているなら、その手順は `skill` 候補です。逆に「常に日本語で答える」「変更後はテストを提案する」のような恒久ルールは `AGENTS.md` 向きです。

## 保守の進め方

skill は作って終わりではありません。次の観点で見直します。

- 今も同じ手順で使えるか
- `description` と実際の使われ方がずれていないか
- 参考元や関連テンプレートが古くなっていないか
- READMEや目次から辿れるか

既存skillを更新したら、必要に応じてサンプル例や周辺ドキュメントも一緒に直します。

## 参考元

このページは以下の参考元に基づいて整理しています。未確認の推測は含めていません。

- [Agent Skills - Codex](https://developers.openai.com/codex/skills)
- [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)
- [Using Codex with your ChatGPT plan](https://help.openai.com/en/articles/11369540-codex-in-chatgpt)
