# Web App Starter

## 概要

CodexでWebアプリをゼロから作り始める前に、運用資産を揃えるための最小テンプレートです。実装コードは含めず、任意のスタックにコピーして使える前提にしています。

このexampleは、Codexに「実装コードはまだ書かず、足りない前提を洗い出して」と依頼する段階で使います。要件、設計、環境変数、テスト、レビュー観点が揃ってから実装に入る想定です。

## 含まれるもの

- `AGENTS.md`
- `context.json`
- `.env.example`
- `docs/product/vision.md`
- `docs/specs/story-001-auth/requirement.md`
- `docs/specs/story-001-auth/plan.md`
- `docs/architecture/overview.md`
- `docs/architecture/api.md`
- `docs/architecture/data-model.md`
- `docs/guidelines/environment.md`
- `docs/guidelines/test.md`
- `docs/guidelines/review.md`

## 使い方

1. このディレクトリを新規Webアプリのルートにコピーする
2. `docs/product/vision.md` で目的、対象ユーザー、成功条件を更新する
3. `docs/specs/story-001-auth/` を最初の機能名に合わせて調整する
4. `docs/architecture/` に選んだスタックの画面、API、DB方針を書く
5. `.env.example` に必要な環境変数名だけを追加する
6. `context.json` の references と changed_files を作業単位に合わせる

## context.json の扱い

`changed_files` はサンプルとして記入済みです。新規利用時は空配列に戻してよく、作業後に実際に更新したファイルを追加します。

```json
"changed_files": []
```

## Codexへの依頼例

```txt
examples/web-app-starter をベースに、Webアプリ開発の初期設計を確認して。
実装コードはまだ書かず、vision、story、architecture、test、review の不足だけ指摘して。
```
