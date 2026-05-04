# AI駆動開発ワークフロー概要

> - 種別: curation
> - 参考元: [CyberAgent Developers Blog](https://developers.cyberagent.co.jp/blog/archives/62010/)
> - 最終ファクトチェック: 2026-05-04
> - 確認メモ: 元記事の構成と、このリポジトリ向けの整理方針を確認

OpenAIのCodexに代表される「大規模なコードコンテキストを理解するAIモデル」のポテンシャルを引き出すための、フェーズ分割型ワークフローです。

## このリポジトリでの読み方

このページは「AI駆動開発の全体像」を掴むためのものです。日々の運用に落とすときは、`AGENTS.md`、`skills`、`context.json` のような再利用資産に分解して読むと使いやすくなります。

## AI駆動開発の核心原則

人間が「何を実現したいか」を定義し、AIが「どう進めるか」の選択肢を広げる。

## フェーズ全体

- Phase0: ビジョン策定
- Phase1: フォルダ構造と `AGENTS.md`
- Phase2: 要件定義
- Phase3: アーキテクチャ設計
- Phase4: 環境セットアップ
- Phase5: 機能実装と `context.json` 管理

## 各フェーズの成果物

- Phase0: `vision.md`
- Phase1: フォルダ構造、`AGENTS.md`
- Phase2: `requirement.md`、`wireframes.md`、`domain-model.md`
- Phase3: `architecture.md`、`tech-stack.md`
- Phase4: `project-rules.md`、`test-guidelines.md`
- Phase5: ソースコード、テストコード、`context.json`

## フォルダ構成のサンプル

```txt
feature-request-board/
├── docs/
│   ├── specs/
│   ├── stories/
│   └── guidelines/
├── src/
├── tests/
├── README.md
└── AGENTS.md
```

## 実務でのポイント

- 先に仕様を作る
- 実装履歴は `context.json` に寄せる
- 複数ストーリーを並行するときほど、文書の置き場を固定する

## 具体例

新機能を作る前に `requirement.md` と `plan.md` を先に作っておくと、Codexに「どこまで決まっているか」を毎回説明せずに済みます。

## 参考元

このページは以下の参考元に基づいて整理しています。未確認の推測は含めていません。

- [CyberAgent Developers Blog](https://developers.cyberagent.co.jp/blog/archives/62010/)
