# codex-memo

Codexを日本語で学び、実務で使いこなすためのメモリポジトリです。

## 何があるか

- 公式ドキュメントの日本語要約
- 導入から運用までのワークフロー
- `AGENTS.md`、`skills`、`hooks` の設計メモ
- Qiita / Zenn など外部知見の再編集ノート

## 読み進め方

### まず読む

- [VS Codeで始めるCodex](./docs/getting-started/vscode-codex.md)
- [最初の1セッションの進め方](./docs/getting-started/first-session.md)

### 運用を整える

- [公式ベストプラクティス要約](./docs/official/best-practices.md)
- [AGENTS.mdの運用方針](./docs/operations/agents-md.md)
- [skillsの追加基準](./docs/operations/skills.md)
- [hooksの追加基準](./docs/operations/hooks.md)
- [記事台帳](./docs/operations/article-registry.md)
- [公式要約テンプレート](./docs/templates/official-summary.md)
- [外部知見テンプレート](./docs/templates/curation-summary.md)

### 全体を見る

- [ドキュメント一覧](./docs/SUMMARY.md)

## skillsの使い方

このリポジトリでは、共有skillを `.agents/skills/` に置いています。
使いたいときは、skill名を明示して依頼すると発火しやすくなります。

### URL要約skillの例

`url-to-markdown-summary` を使うと、URLからそのまま保存しやすいMarkdown記事を作れます。

```txt
Use $url-to-markdown-summary to turn this OpenAI documentation URL into a save-ready Japanese Markdown article.
保存先は docs/official を想定。
```

```txt
Use $url-to-markdown-summary to summarize these Qiita and Zenn URLs into a Japanese Markdown article.
記事ごとの感想ではなく、docs/curation 向けにテーマ単位で再構成して。
```

### 自然文でも依頼できる例

```txt
このOpenAI公式URLを日本語で分かりやすくMarkdown記事にして。
保存先は docs/official を想定。
```

```txt
このQiitaとZennの記事を元に、AGENTS.md運用の実践知見を docs/curation 向けのMarkdownにまとめて。
```

### ファクトチェック用の例

```txt
Use $url-to-markdown-summary to re-check this official article against its source URL.
差分があれば本文と最終ファクトチェック日を更新して、article-registry.md のメモも更新して。
```

```txt
この curation 記事を原典URLで見直して、古くなった主張があれば修正案を出して。
最終ファクトチェック日と確認メモも更新して。
```

## 具体例

例えば「Codexに毎回同じ説明をしている」と感じたら、`docs/operations/agents-md.md` と `docs/templates/AGENTS.md` を見れば、どこまで恒久ルールを外出しすべきか判断しやすくなります。

URLを渡して最初から保存用Markdown記事を作りたいときは、`.agents/skills/url-to-markdown-summary/` のskill設計と `docs/templates/official-summary.md` / `docs/templates/curation-summary.md` を見ると運用しやすいです。

記事を増やしてきたら、`docs/operations/article-registry.md` に原典URLと最終ファクトチェック日を残しておくと、どこを再確認すべきか追いやすくなります。
