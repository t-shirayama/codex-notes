# テスト方針

## 概要

Webアプリの変更をどの粒度で確認するかを書く。

## unit

- 純粋な変換処理
- バリデーション
- 権限判定の小さな関数

## integration

- APIの入出力
- DB保存と取得
- 認証状態の取得

## e2e

- 未ログイン時のログイン導線
- ログイン済み時の表示
- ログアウト後の表示
- 認証失敗時のエラー表示

## 実行メモ

実際のコマンドはプロジェクトのスタックに合わせて書く。

```txt
unit: <unit test command>
integration: <integration test command>
e2e: <e2e test command>
```
