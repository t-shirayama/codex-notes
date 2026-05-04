# AGENTS.md

## Purpose

このリポジトリの目的を書く。

## Scope

- このファイルはリポジトリルートに置く
- 下位ディレクトリで別ルールが必要なら、その場所に `AGENTS.md` または `AGENTS.override.md` を置く
- 一時的な上書きは `AGENTS.override.md` に書き、不要になったら削除する

## Repository Expectations

- 変更前に対象ファイルと既存ルールを確認する
- 完了時に変更内容と確認結果を短くまとめる

## Source Priority

- 公式ドキュメント
- 実測や一次情報
- 外部記事の再編集

## Directory Roles

- `docs/getting-started/`: 初学者向け
- `docs/operations/`: 運用ルール

## Writing Rules

- 1ファイル1トピック
- 具体例を入れる
- 冗長な前置きは書かない

## Editing Rules

- 既存ファイル更新を優先する
- 目次更新時は `docs/SUMMARY.md` も更新する

## Verification

- 変更に応じた確認コマンドを書く
- 確認できなかった場合は理由を残す
