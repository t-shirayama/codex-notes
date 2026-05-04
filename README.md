# codex-memo

Codexを日本語で学び、実務で使いこなすためのメモリポジトリです。
このリポジトリは実行コードではなく、Codexの導入・運用・知識蓄積を整理するドキュメント集です。

## 何があるか

- 公式ドキュメントの日本語要約
- 導入から運用までのワークフロー
- `AGENTS.md`、`skills`、`hooks` の設計メモ
- Qiita / Zenn など外部知見の再編集ノート

## 使い方

1. [VS Codeで始めるCodex](./docs/getting-started/vscode-codex.md) から読む
2. 自分のプロジェクトに合う [AGENTS.mdテンプレート](./docs/templates/AGENTS.md) をコピーして調整する
3. 繰り返す作業があれば [URL To Markdown Summary](./.agents/skills/url-to-markdown-summary/SKILL.md) や [SKILL.mdテンプレート](./docs/templates/SKILL.md) を参考に skill 化する
4. 公式情報を見直したら [記事台帳](./docs/operations/article-registry.md) の日付とメモを更新する
5. Webアプリをゼロから始めるときは [Webアプリ開発スターター](./docs/workflows/web-app-codex-starter.md) と [Web App Starter](./examples/web-app-starter/README.md) を確認する

## 読み進め方

### まず読む

- [VS Codeで始めるCodex](./docs/getting-started/vscode-codex.md)
- [最初の1セッションの進め方](./docs/getting-started/first-session.md)

### 運用を整える

- [公式ベストプラクティス要約](./docs/official/best-practices.md)
- [Webアプリ開発スターター](./docs/workflows/web-app-codex-starter.md)
- [AGENTS.mdの運用方針](./docs/operations/agents-md.md)
- [skillsの追加基準](./docs/operations/skills.md)
- [skills作成ガイド](./docs/operations/skill-authoring.md)
- [MCPの運用方針](./docs/operations/mcp.md)
- [hooksの追加基準](./docs/operations/hooks.md)
- [記事台帳](./docs/operations/article-registry.md)
- [公式要約テンプレート](./docs/templates/official-summary.md)
- [外部知見テンプレート](./docs/templates/curation-summary.md)

### 全体を見る

- [ドキュメント一覧](./docs/SUMMARY.md)

## skillsの使い方

このリポジトリでは、共有skillを `.agents/skills/` に置いています。
使いたいときは、skill名を明示して依頼すると発火しやすくなります。
作る側の判断基準は [skillsの追加基準](./docs/operations/skills.md) と [skills作成ガイド](./docs/operations/skill-authoring.md) にまとめています。

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
この curation 記事を参考元で見直して、古くなった主張があれば修正案を出して。
最終ファクトチェック日と確認メモも更新して。
```

## 具体例

例えば「Codexに毎回同じ説明をしている」と感じたら、`docs/operations/agents-md.md` と `docs/templates/AGENTS.md` を見れば、どこまで恒久ルールを外出しすべきか判断しやすくなります。

URLを渡して最初から保存用Markdown記事を作りたいときは、`.agents/skills/url-to-markdown-summary/` のskill設計と `docs/templates/official-summary.md` / `docs/templates/curation-summary.md` を見ると運用しやすいです。

Webアプリを初めからCodexで開発するなら、`examples/web-app-starter/` をコピーして、要件、設計、環境変数、テスト、レビュー観点を先に埋めると始めやすくなります。

記事を増やしてきたら、`docs/operations/article-registry.md` に参考元と最終ファクトチェック日を残しておくと、どこを再確認すべきか追いやすくなります。

作業中の計画だけをルートの `PLAN.md` に置き、完了済みの計画は `docs/archive/plans/` に移します。

## 設定ファイル

- `.codex/`: Codex向けのリポジトリ設定とhook補助スクリプトの置き場
- `.vscode/`: VS CodeでMarkdownを読みやすくするための補助設定
- `.agents/skills/`: 再利用可能なCodex skillの置き場

## GitHubメタデータの推奨値

このリポジトリを公開・再利用しやすくするため、GitHubのAboutには以下を設定します。

```txt
Description:
Japanese Codex operations knowledge base: AGENTS.md, skills, hooks, workflows, and curated docs.

Topics:
codex, openai, agents-md, ai-coding, developer-tools, japanese, documentation, workflow
```

## License

このリポジトリは [MIT License](./LICENSE) で公開しています。
