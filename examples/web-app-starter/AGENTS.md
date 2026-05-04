# AGENTS.md

## Purpose

このリポジトリは、WebアプリをCodexで開発するためのスターターです。Codexは、要件、設計、環境変数、テスト、レビュー観点の整合性を保ちながら、小さく安全に変更してください。

## Source Priority

- `docs/specs/`: 機能ごとの要件と計画
- `docs/architecture/`: 画面、API、DB、外部サービスの設計
- `docs/guidelines/`: 環境変数、テスト、レビューの運用ルール
- `context.json`: 今回の作業対象と参照ファイル

## Editing Rules

- 仕様を変えたら `requirement.md`、`plan.md`、architecture系ファイルを同期する
- APIやDBを変えたら、テスト方針と環境変数への影響を確認する
- 秘密情報、実トークン、実パスワードをコミットしない
- 完了時は変更内容、確認コマンド、未確認理由を短くまとめる

## Review Checklist

- 要件、計画、API、DBが矛盾していないか
- 認証と権限の失敗ケースを考慮しているか
- `.env.example` と `docs/guidelines/environment.md` が一致しているか
- unit / integration / e2e のどこで確認するかが明記されているか
- `context.json` の references と changed_files が最新か

## Out Of Scope

- フレームワーク固有の詳細最適化
- 本番秘密情報の記載
- 未合意の大規模リネーム
