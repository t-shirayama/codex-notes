# Webアプリ開発スターター

> - 種別: operations
> - 参考元: [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices), [Custom instructions with AGENTS.md](https://developers.openai.com/codex/guides/agents-md), [Using Codex with your ChatGPT plan](https://help.openai.com/en/articles/11369540-codex-in-chatgpt), [Codex CLI](https://developers.openai.com/codex/cli)
> - 最終ファクトチェック: 2026-05-23
> - 確認メモ: `examples/` との重複を抑えつつ、本文にも最小構成とカスタマイズ方針を掲載

## 概要

WebアプリをCodexで作り始める前に、要件、設計、環境変数、テスト、レビュー観点を先に揃えるためのスターターです。実装コードを生成する前に、Codexが参照できる土台を作ることで、毎回の説明を短くし、差分レビューもしやすくします。

実際にコピーして使うテンプレートは `examples/web-app-starter/` に置き、このページでは考え方とカスタマイズ方針を説明します。

このページはスタック非依存です。Next.js、Vite、Rails、Djangoなど、具体的な技術はプロジェクト側で選びます。

## 使いどころ

- 新規Webアプリをゼロから始める
- 仕様、設計、テスト方針をCodexに毎回説明したくない
- 認証、API、DB、環境変数の影響範囲を先に見える化したい
- チームでCodexに渡す前提ファイルを揃えたい

## 最初に作るファイル

最小構成は次の形です。実装コードを置く前に、Codexが参照する前提ファイルだけを先に作ります。

```txt
web-app/
├── AGENTS.md
├── context.json
├── .env.example
└── docs/
    ├── product/
    │   └── vision.md
    ├── specs/
    │   └── story-001-auth/
    │       ├── requirement.md
    │       └── plan.md
    ├── architecture/
    │   ├── overview.md
    │   ├── api.md
    │   └── data-model.md
    └── guidelines/
        ├── environment.md
        ├── test.md
        └── review.md
```

## セットアップ手順

### 1. 目的と成功条件を書く

`docs/product/vision.md` に、誰の何を解決するアプリか、成功条件は何かを書きます。画面やAPIを決める前に、対象ユーザーと対象外を固定します。

### 2. Codexの恒久ルールを置く

`AGENTS.md` に、Webアプリ開発で毎回守るルールを書きます。仕様変更時は `requirement.md`、`plan.md`、architecture系ファイルを同期すること、秘密情報をコミットしないこと、完了時に確認結果を残すことを固定します。

### 3. 最初のstoryを作る

`docs/specs/story-001-auth/requirement.md` に要件、`plan.md` に実装前の計画を書きます。最初のstoryは認証でなくても構いませんが、Webアプリでは認証、権限、データ保存、エラー表示の影響が出やすいため、最初に扱う例として向いています。

### 4. アーキテクチャを薄く決める

`docs/architecture/overview.md` で画面、API、DB、外部サービスの関係を整理します。`api.md` にはエンドポイントや入出力、`data-model.md` には主要テーブルや制約を書きます。

### 5. 環境変数と秘密情報の扱いを決める

`.env.example` と `docs/guidelines/environment.md` を用意します。実トークンやパスワードは書かず、必要な変数名、用途、ローカルでの扱いだけを残します。

### 6. テストとレビュー観点を固定する

`docs/guidelines/test.md` に unit / integration / e2e のどこで何を確認するかを書きます。`docs/guidelines/review.md` には、API、DB、認証、環境変数、エラー表示のチェック観点を入れます。

### 7. context.jsonで作業単位を渡す

`context.json` に、今のtask、参照ファイル、変更ファイルを残します。作業前は `changed_files` を空にしてよく、作業後は実際に更新したファイルを追加します。

## Codexに参照させる情報の優先順

1. `AGENTS.md` で恒久ルールを読ませる
2. `docs/product/vision.md` で目的と対象外を確認させる
3. `docs/specs/<story>/requirement.md` と `plan.md` で作業範囲を固定する
4. `docs/architecture/` でAPIやDBへの影響を確認させる
5. `docs/guidelines/test.md` と `review.md` で完了条件を固定する
6. `context.json` で今回の参照ファイルと変更ファイルを共有する

## 判断基準

- 要件が曖昧なら、実装より先に `requirement.md` を直す
- APIやDBに触るなら、`api.md` と `data-model.md` も更新対象にする
- 環境変数を増やすなら、`.env.example` と `environment.md` を同時に更新する
- 認証や権限に触るなら、e2eまたは統合テスト観点を追加する
- 完了済みの作業計画は削除し、後で参照する理由がある場合だけ `docs/archive/plans/` へ移す

## 具体例

```txt
新規Webアプリの開発準備をしたい。
まず vision.md、story-001-auth の requirement / plan、architecture、test、review の整合性を確認して。
実装コードはまだ書かず、足りない前提だけ洗い出して。
```

この依頼なら、Codexは実装に入る前に、要件、設計、テスト、レビュー観点の不足を確認できます。

## 参考元

このページは以下の参考元に基づいて整理しています。未確認の推測は含めていません。

- [OpenAI Codex Best Practices](https://developers.openai.com/codex/learn/best-practices)
- [Custom instructions with AGENTS.md](https://developers.openai.com/codex/guides/agents-md)
- [Using Codex with your ChatGPT plan](https://help.openai.com/en/articles/11369540-codex-in-chatgpt)
- [Codex CLI](https://developers.openai.com/codex/cli)
