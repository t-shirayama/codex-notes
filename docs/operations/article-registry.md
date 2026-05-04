# 記事台帳

## 概要

この台帳では、`docs/official/` と `docs/curation/` の記事について、原典URLと最終ファクトチェック日を記事ごとに管理します。

## ステータスの意味

- `checked`: 現時点の原典と照合済み
- `needs-review`: 原典更新や本文見直しの可能性がある
- `draft`: 下書き段階

`checked` は恒久的な正確性保証ではなく、記録日時点で原典を確認したことを意味します。

## Articles

| 記事タイトル | パス | 種別 | 原典URL | 最終ファクトチェック日 | ステータス | メモ |
| --- | --- | --- | --- | --- | --- | --- |
| 公式ベストプラクティス要約 | `docs/official/best-practices.md` | `official` | `https://developers.openai.com/codex/learn/best-practices` | `2026-05-04` | `checked` | 原典リンクと要約構成を確認 |
| AGENTS / config / skills / hooks の役割 | `docs/official/agents-config-skills-hooks.md` | `official` | `https://developers.openai.com/codex/learn/best-practices` | `2026-05-04` | `checked` | 既存説明を原典ベースの運用解説として整理 |
| AGENTS.md設計パターン集 | `docs/curation/agents-md-patterns.md` | `curation` | 記事群ベース。追加時に原典URLを追記する | `2026-05-04` | `needs-review` | 原典URL未登録。今後追加前提 |
| 複数エージェント運用メモ | `docs/curation/multi-agent-workflows.md` | `curation` | 記事群ベース。追加時に原典URLを追記する | `2026-05-04` | `needs-review` | 原典URL未登録。今後追加前提 |

## 更新ルール

- 記事を新規作成したら、この台帳にも1行追加する
- 記事の原典を見直したら、本文の `最終ファクトチェック` とこの台帳の両方を更新する
- 複数原典がある場合は、同じセル内で改行または箇条書きで残してよい
- 変更がない場合も `最終ファクトチェック日` とメモは更新してよい
