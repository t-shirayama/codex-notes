---
name: url-to-markdown-summary
description: Generate save-ready Japanese Markdown articles from source URLs. Use when Codex receives official documentation URLs, Qiita URLs, Zenn URLs, blog URLs, or multiple reference URLs and should turn them into a structured summary that can be placed directly under docs/official or docs/curation without a separate rewrite step.
---

# URL To Markdown Summary

URLを受け取り、そのまま保存できる日本語Markdown記事にまとめる。出力は会話用のメモではなく、`docs/official/` または `docs/curation/` に置ける本文を前提にする。

## Workflow

### 1. 入力を整理する

- URLが1件か複数件か確認する
- ユーザーが保存先カテゴリを指定していればそれを優先する
- 指定がなければ URL の種類から `official` か `curation` を判定する

### 2. 情報源を判定する

- OpenAIなど一次情報の公式URLは `official`
- Qiita、Zenn、個人ブログ、登壇資料の紹介記事は `curation`
- 公式URLと外部記事が混在する場合は、事実の軸を公式に置き、外部記事は補足として扱う

詳しい判定ルールは [references/source-classification.md](references/source-classification.md) を読む。

### 3. 出力テンプレートを選ぶ

- `official` は [references/official-output-format.md](references/official-output-format.md) に従う
- `curation` は [references/curation-output-format.md](references/curation-output-format.md) に従う
- 複数URLのときは、記事ごとの要約ではなくテーマ単位で再構成する

### 4. 本文を書く

- 1ファイル1トピックを守る
- 原典URLを末尾に残す
- 見出しだけを並べず、「実務でどう使うか」を1段落入れる
- 公式の事実と外部記事の意見を混ぜない
- 長い逐語訳にせず、日本語で読みやすく再構成する

### 5. 保存先を提案する

- 公式要約は `docs/official/<topic>.md`
- 外部知見は `docs/curation/<topic>.md`
- 保存名はサイト名ではなくテーマ名を優先する
- 既存ファイルと重複する場合は新規作成より更新を優先する

## Output Rules

- 出力はそのままコミットできるMarkdown本文にする
- 先頭に不要な前置きは書かない
- 見出し構造は `# / ## / ###` を使う
- 具体例を1つ以上入れる
- URLが読めない場合は、未確認で断定せず不足情報を明記する

## Prompt Patterns

```txt
このOpenAI公式URLを日本語で分かりやすくMarkdown記事にして。
保存先は docs/official を想定。
```

```txt
このQiitaとZennの記事を元に、AGENTS.md運用の実践知見を docs/curation 向けのMarkdownにまとめて。
記事ごとの感想ではなく、テーマ単位で再構成して。
```

```txt
この公式URLと解説記事URLをまとめて、事実は公式ベース、補足は外部記事ベースで整理したMarkdown記事にして。
```

## Resources

- `references/source-classification.md`: 情報源の扱い分け
- `references/official-output-format.md`: 公式要約の出力枠
- `references/curation-output-format.md`: 外部知見の出力枠
