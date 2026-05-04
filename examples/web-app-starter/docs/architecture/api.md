# API設計

## 概要

APIの入出力、認証要否、エラー時の扱いを書く。

## エンドポイント例

| Method | Path | 認証 | 用途 |
| --- | --- | --- | --- |
| `GET` | `/api/auth/session` | 任意 | 現在のログイン状態を返す |
| `POST` | `/api/auth/logout` | 必須 | ログアウトする |

## レスポンス例

```json
{
  "authenticated": true,
  "user": {
    "id": "user_001",
    "displayName": "Sample User"
  }
}
```

## エラー方針

- 認証状態を取得できない場合は、UIで再試行できる表示にする
- 権限不足は認証失敗と区別する
- 詳細な内部エラーを利用者に表示しない
