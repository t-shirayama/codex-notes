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
- [公式要約テンプレート](./docs/templates/official-summary.md)
- [外部知見テンプレート](./docs/templates/curation-summary.md)

### 全体を見る

- [ドキュメント一覧](./docs/SUMMARY.md)

## 具体例

例えば「Codexに毎回同じ説明をしている」と感じたら、`docs/operations/agents-md.md` と `docs/templates/AGENTS.md` を見れば、どこまで恒久ルールを外出しすべきか判断しやすくなります。

URLを渡して最初から保存用Markdown記事を作りたいときは、`.agents/skills/url-to-markdown-summary/` のskill設計と `docs/templates/official-summary.md` / `docs/templates/curation-summary.md` を見ると運用しやすいです。
