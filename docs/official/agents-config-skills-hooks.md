# AGENTS / config / skills / hooks の役割

> 種別: official
> 原典: [best-practices](https://developers.openai.com/codex/learn/best-practices)
> 最終ファクトチェック: 2026-05-04
> 確認メモ: 原典をもとに運用要素の役割を再整理

## 概要

Codexを継続的に使うときは、毎回のプロンプトだけで運用せず、ルールと手順をファイルに外出しすると安定します。

## 何が分かるか

- `AGENTS.md` に何を書くか
- `config.toml` をいつ使うか
- `skills` と `hooks` の役割の違い
- どういう順番で整備すると効果が出やすいか

## 役割分担

### AGENTS.md

- プロジェクトで毎回守ってほしい恒久ルールを書く
- 命名、テスト、禁止事項、完了条件を短くまとめる

### config.toml

- Codexの実行設定を置く
- 権限やデフォルト動作を揃えたいときに使う

### skills

- 何度も繰り返す手順を再利用できる形にする
- 1 skill = 1業務に絞る

### hooks

- 実行前後の定型チェックや通知を自動化する
- 安全確認やログ整形のような定型処理に向く

### PLANS.md

- 複雑なタスクの前提、決定事項、受け入れ条件を残す
- Planモードと相性がよい

## 実務での意味

- 毎回同じ注意点を伝えなくてよくなる
- セッションが変わっても運用ルールを保ちやすい
- 複雑な作業を人とAIで分担しやすくなる

## 整備の順番

1. `AGENTS.md`
2. `config.toml`
3. 繰り返し作業の `skill`
4. 安全確認の `hook`
5. 複雑作業の `PLANS.md`

## 具体例

```txt
AGENTS.md:
- テスト前に変更意図を説明する
- 返答は日本語

skill:
- リリースノート作成
- PRレビューの定型観点

hook:
- 危険コマンドの確認
- 変更後のチェックコマンド案内
```

## 原典

- https://developers.openai.com/codex/learn/best-practices
