# hooksの運用方針

> - 種別: official
> - 参考元: [Hooks - Codex](https://developers.openai.com/codex/hooks)
> - 最終ファクトチェック: 2026-05-04
> - 確認メモ: hooks の探索場所、feature flag、リポジトリ内スクリプト置き場の扱いを確認

## 概要

`hook` は、Codexのライフサイクル中に決定的なスクリプトを実行するための仕組みです。会話開始時、ツール実行前後、停止時などに、ログ保存・安全確認・検証案内のような定型処理を差し込むために使います。

ここで書いている内容は公開情報をもとにした運用方針であり、未確認の推測ではありません。

## 向いている処理

- 危険操作の確認
- 変更後に案内したいチェックコマンド
- ログや実行結果の整形
- 会話や作業結果を決まった形式で記録する処理

## 向いていない処理

- 毎回内容が大きく変わる判断
- 本質的に人がレビューすべき承認
- 失敗時の影響が大きい自動変更
- hooks同士の実行順に依存する処理

## 置き場

Codexがhook設定として探索するのは、`hooks.json` または `config.toml` 内の `[hooks]` です。

| 範囲 | 置き場 |
| --- | --- |
| ユーザー共通 | `~/.codex/hooks.json` または `~/.codex/config.toml` |
| リポジトリ単位 | `.codex/hooks.json` または `.codex/config.toml` |
| plugin配布 | plugin manifest または `hooks/hooks.json` |

`.codex/hooks/` は公式のhook設定ファイル名ではなく、リポジトリ内で呼び出すスクリプトを置くための補助ディレクトリとして使うのが安全です。hook設定からスクリプトを呼ぶ場合は、Codexをサブディレクトリから起動しても動くように、gitルート基準で解決できるパスにします。

## 有効化

hooks は `config.toml` の feature flag で有効化します。

```toml
[features]
codex_hooks = true
```

リポジトリ単位のhookは、そのプロジェクトの `.codex/` レイヤーが信頼されている場合に読み込まれます。信頼していないプロジェクトでは、ユーザー共通やシステム側のhookだけが読み込まれる前提で設計します。

## 実行時の注意

- 複数のhook設定に一致した場合、該当するhookはすべて実行される
- 同じイベントに複数のコマンドhookがある場合、並行して起動される
- 上位レイヤーのhookが下位レイヤーのhookを置き換えるわけではない
- 同じレイヤーで `hooks.json` と `[hooks]` を併用するとマージされるため、基本はどちらか一方に寄せる

## このリポジトリでの使い分け

- hook設定: `.codex/hooks.json` または `.codex/config.toml`
- hookから呼ぶスクリプト: `.codex/hooks/`
- テンプレート: `docs/templates/hook.ps1`

## 導入フロー

1. 先に文書で手順を安定させる
2. 入出力を固定する
3. `config.toml` で `codex_hooks` を有効化する
4. 小さなhook設定を `hooks.json` または `[hooks]` に追加する
5. 必要なら実行スクリプトを `.codex/hooks/` に置く
6. 説明を `docs/operations/hooks.md` に反映する

## 具体例

「ドキュメントを更新したらリンク確認を促す」程度の軽い補助は `hook` に向いています。

例えば、`Stop` イベントで変更ファイルを確認し、Markdownが更新されていれば「リンク確認と記事台帳更新を忘れない」と通知する処理は候補になります。一方で、参考元の正確性判断や公開可否の最終承認は人が見るべきです。

## 参考元

このページは以下の参考元に基づいて整理しています。未確認の推測は含めていません。

- [Hooks - Codex](https://developers.openai.com/codex/hooks)
