# データモデル設計

## 概要

主要なエンティティ、関係、制約を書く。

## エンティティ例

### User

| フィールド | 型 | 必須 | メモ |
| --- | --- | --- | --- |
| `id` | string | yes | 内部ユーザーID |
| `email` | string | yes | 一意 |
| `display_name` | string | no | 画面表示名 |
| `created_at` | datetime | yes | 作成日時 |

### Session

| フィールド | 型 | 必須 | メモ |
| --- | --- | --- | --- |
| `id` | string | yes | セッションID |
| `user_id` | string | yes | Userへの参照 |
| `expires_at` | datetime | yes | 有効期限 |

## 制約

- メールアドレスは一意にする
- セッションは期限切れを扱う
- 認証プロバイダー固有IDを保存する場合は、別フィールドとして明記する
