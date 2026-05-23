# AGENTS.md

## Purpose

Feature Request Board のミニプロジェクト例です。Codexには、要件、計画、レビュー観点を分けて読み、変更内容を小さく保つことを期待します。

## Directory Roles

- `docs/specs/`: 機能ごとの要件と計画
- `docs/guidelines/`: レビュー観点や作業ルール
- `context.json`: 今回の作業対象と関連ファイル

## Editing Rules

- 1つのstoryにつき1つのspecディレクトリを使う
- 要件を変えたらplanも見直す
- レビュー観点を変えたら `docs/guidelines/review.md` を更新する

## Verification

- 受け入れ条件が要件とplanの両方に反映されているか確認する
- 変更後は関連ファイルを `context.json` に追加する
