# レビュー観点

## 概要

Codexに `/review` を依頼するときの観点を揃える。

## チェックリスト

- 要件とplanの受け入れ条件が一致しているか
- APIの認証要否とエラー方針が明確か
- DBの保存項目と制約が過不足ないか
- 環境変数が `.env.example` と `environment.md` に反映されているか
- unit / integration / e2e の確認観点が足りているか
- 秘密情報や本番値が含まれていないか
- `context.json` の references と changed_files が最新か

## レビュー依頼例

```txt
/review
examples/web-app-starter の story-001-auth をレビューして。
実装コードではなく、要件、API、DB、環境変数、テスト観点の不足を優先して指摘して。
```
