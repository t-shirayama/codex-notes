# AGENTS.md

## Purpose

このリポジトリは「Codex運用ナレッジ」を蓄積・整理するためのものです。
AIはドキュメントの一貫性・再利用性・読みやすさを最優先で行動してください。

---

## Principles

- 小さく変更する（Small diffs）
- 既存構造を尊重する（Don't restructure without reason）
- 重複を避ける（Avoid duplication）
- 説明より構造で解決する（Prefer structure over verbosity）

---

## Writing Rules

- Markdownで書く
- 見出し構造を必ず使う（# / ## / ###）
- 1ファイル = 1トピック
- 冗長な前置きは禁止
- 具体例を必ず含める

Bad:
長い説明だけ

Good:

- 概要
- 手順
- コード例

---

## File Organization

新しいファイルを作る場合は以下に従う：

- getting-started → 初学者向け
- workflows → 開発フロー
- best-practices → 設計・運用指針
- alternatives → 他ツール比較
- templates → 再利用可能な雛形
- examples → 実例

---

## Editing Rules

- 既存ファイルを優先的に更新する
- 同じ内容の新規ファイルを作らない
- 大きなリネームは禁止（必要なら提案のみ）

---

## Codex Behavior

- 変更前に必ず意図を説明する
- 複雑な変更はステップに分ける
- 破壊的変更は禁止
- 不明点は推測せず質問する

---

## Templates

以下を優先的に使う：

- docs/templates/AGENTS.md
- docs/templates/PLANS.md
- docs/templates/context.json

---

## Out of Scope

- 実行コードの最適化
- アプリケーション開発
- 無関係な技術記事

---

## Goal

このリポジトリを読むだけで、
「Codexを使った開発のやり方」が理解できる状態にする。
