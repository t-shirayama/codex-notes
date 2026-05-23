# skills作成ガイド

> - 種別: official
> - 参考元: [Agent Skills - Codex](https://developers.openai.com/codex/skills), [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices), [Using Codex with your ChatGPT plan](https://help.openai.com/en/articles/11369540-codex-in-chatgpt)
> - 最終ファクトチェック: 2026-05-23
> - 確認メモ: skillの作成基準、発火設計、探索場所、pluginとの役割分担を確認

## 概要

このページは、Codexで使う `skill` を実務レベルで設計するためのガイドです。公式情報では、skill は再利用ワークフローの authoring format、plugin はインストール可能な配布単位として扱われています。このリポジトリでは、その考え方を日本語ナレッジベース向けに具体化します。

## まず押さえる役割分担

`skill` は万能ではありません。どこに何を書くかを先に分けると、運用が崩れにくくなります。

- `AGENTS.md`: 毎回守ってほしい恒久ルール
- `skill`: 会話から呼び出したい再利用手順
- `hook`: 実行前後の定型チェックや補助処理
- `plugin`: 複数skill、アプリ連携、MCP設定などをまとめて配布する単位

## 追加すべきskillの条件

- 同じ依頼を2回以上繰り返している
- 入力がある程度定型化できる
- 出力の品質基準を文章で説明できる
- 手順を固定すると早くなる
- 他の人にも再利用してほしい

## まだskill化しない方がよい条件

- 依頼ごとに判断軸が大きく変わる
- 参考情報が毎回ばらばらで説明しにくい
- 手順よりも対話的な探索が本質
- 恒久ルールとして書く方が自然
- 自動実行しないと意味がない

## 作成フロー

### 1. 先に手順を文章で安定させる

いきなり `SKILL.md` を作るより、まず `docs/operations/` や既存記事の中で手順を安定させます。3回くらい同じ流れで使えたら、skill に切り出しやすくなります。

### 2. 入力と出力を固定する

少なくとも次を言語化します。

- 何を受け取るか
- 何を返すか
- どこまでやるか
- 何はやらないか

例:

- 入力: OpenAI公式URL 1件または複数件
- 出力: `docs/official/` に保存しやすい日本語Markdown本文

### 3. 1 skill = 1業務に絞る

公式のベストプラクティスでも、skill は1つの仕事に集中させる方針が示されています。要約、翻訳、レビュー、公開準備までを1つに詰め込むと、発火条件も出力品質もぶれやすくなります。

### 4. Trigger を自然文で書く

skill名を明示した依頼だけでなく、自然文でも使いどころが伝わるようにします。

悪い例:

- URLを処理する

良い例:

- OpenAI公式URLやQiita / ZennのURLを受け取り、保存用Markdown記事にまとめるとき
- 既存記事を参考元URLで再確認し、本文とファクトチェック日を更新するとき

### 5. Steps は命令形で書く

公式の skills ページでは、明示的な入力と出力を持つ命令形のステップが推奨されています。読む人が手順を追える形にすると、skill の再利用性が上がります。

良い書き方:

1. URLの種類を判定する
2. 参考元の優先順位を決める
3. 出力テンプレートを選ぶ
4. 本文を構成する
5. 保存先と更新対象を提案する

## 発火しやすいskillの書き方

### description を具体化する

`description` には、使う場面、入力の種類、出力の形を入れます。ここが短すぎると、「いつこの skill を使えばいいか」が伝わりません。

### Example を複数置く

最低1例は必須ですが、可能なら次の2系統を置くと実務で強いです。

- skill名を明示する依頼
- 自然文だけで依頼する例

### 曖昧な語を減らす

「整理する」「いい感じにまとめる」だけでは、人によって解釈が揺れます。どこに保存する前提か、どの粒度で書くか、参考元を残すかまで入れると安定します。

## よいskillと悪いskill

### よいskill

- 入力が明確
- 出力が明確
- 手順が短い
- 他の依頼に転用しやすい
- 参考元や判断基準が書いてある

### 悪いskill

- 複数業務をまとめすぎている
- 役割が `AGENTS.md` や `hook` と重複している
- Steps が抽象的すぎる
- Example がなく、使いどころが読めない
- 何を更新対象に含めるか書いていない

## このリポジトリ向けの作成チェックリスト

1. 既存ファイルで同じ論点を説明していないか確認する
2. `docs/templates/SKILL.md` をベースに書く
3. YAML front matter に `name` と `description` を書く
4. `Purpose`、`Trigger`、`Inputs`、`Outputs`、`Steps`、`Example` を埋める
5. 参考元がある作業なら、どこを見るか明記する
6. 実例で1回以上試す
7. `docs/operations/skills.md` に導線を足す
8. 目次を変えたら `docs/SUMMARY.md` と必要なら `README.md` も更新する

## 探索場所と共有範囲

Codexは、リポジトリ、ユーザー、管理者、システムの各スコープからskillを読み込みます。リポジトリでは、Codexを起動した作業ディレクトリからリポジトリルートまでの `.agents/skills` が対象です。個人用skillは `$HOME/.agents/skills`、管理者用skillは `/etc/codex/skills` に置けます。

同じ `name` のskillが複数ある場合、Codexは自動マージしません。用途が重なるskillを増やすと選択がぶれやすいため、descriptionで範囲を明確にするか、不要なskillを無効化します。広く配布したい場合や複数skillをまとめたい場合は、plugin化を検討します。

## 具体例

### skill向きの例

- 公式ドキュメントを保存用Markdown記事に変換する
- 複数の参考URLからテーマ単位の curation 記事を作る
- 既存記事を参考元でファクトチェックする

### skill向きではない例

- 返答は必ず日本語にする
- 変更後は毎回 lint を案内する
- 危険コマンド実行前に確認を入れる

上の3つは、それぞれ `AGENTS.md` か `hook` で扱う方が自然です。

## 最小テンプレートの使い方

[SKILL.mdテンプレート](../templates/SKILL.md) は最小構成です。実運用では必要に応じて以下を足してください。

- 参考元
- 保存先の例
- 更新対象ファイル
- Prompt Patterns
- Resources

## 保守の進め方

skill は作って終わりではありません。次の観点で見直します。

- 今も同じ手順で使えるか
- `description` と実際の使われ方がずれていないか
- 参考元や関連テンプレートが古くなっていないか
- READMEや目次から辿れるか

既存skillを更新したら、必要に応じてサンプル例や周辺ドキュメントも一緒に直します。

## 実例

このリポジトリの [`url-to-markdown-summary`](../../.agents/skills/url-to-markdown-summary/SKILL.md) は、入力、分類、出力フォーマット、ファクトチェック更新までが揃っているため、skill 設計の参考になります。

## 参考元

このページは以下の参考元に基づいて整理しています。未確認の推測は含めていません。

- [Agent Skills - Codex](https://developers.openai.com/codex/skills)
- [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)
- [Using Codex with your ChatGPT plan](https://help.openai.com/en/articles/11369540-codex-in-chatgpt)
