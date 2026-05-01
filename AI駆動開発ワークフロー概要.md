# AI駆動開発ワークフロー概要

OpenAIのCodexに代表される「大規模なコードコンテキストを理解するAIモデル」のポテンシャルを最大限に引き出すため、
各フェーズで使用するプロンプト、AIの予想出力、そしてコンテキスト管理の方法を体系化したワークフローの提案。

## AI駆動開発の核心原則

人間が「何を実現したいか(Why/What)」を定義し、
AIが「どう進めるか(How)」の最適な選択肢を提示する

## AI駆動開発のフェーズ全体

Phase0: プロジェクト構想: ビジョン策定
Phase1: プロジェクト初期化: フォルダ構造・AGENTS.md
Phase2: 要件定義: ユーザーストーリー・ドメインモデル
Phase3: アーキテクチャ設計: 技術スタック選定
Phase4: 環境セットアップ: パッケージ・ルール定義
Phase5: 機能実装: context.json管理

## 各フェーズの成果物

- Phase0
  - vision.md
    - ビジョンステートメント
    - ターゲットユーザー
    - 主要機能リスト
    - KPI定義
- Phase1
  - フォルダ構造
  - AGENTS.md
    - AIメモリファイル
    - 作業ルール
    - 参照ドキュメント
- Phase2
  - requirement.md
  - wireframes.md
  - domain-model.md
  - context.json
    - (初期状態)
- Phase3
  - architecture.md
  - tech-stack.md
  - adrs/
    - アーキテクチャ
    - 決定事項
- Phase4
  - project-rules.md
  - glossary.md
  - test-guidelines.md
  - package.json
  - 設定ファイル群
- Phase5
  - ソースコード
  - テストコード
  - 仕様書更新
  - context.json
    - (実装進捗に応じて更新)

## フォルダ構成のサンプル

```bash
feature-request-board/
├── docs/
│   ├── specs/                  # 【SSOT】仕様書
│   │   ├── domain-model.md     # ドメインモデル定義
│   │   ├── api-specs.md        # API仕様
│   │   ├── db-schema.md        # DBスキーマ
│   │   ├── glossary.md         # 用語集
│   │   ├── project-rules.md    # プロジェクトルール
│   │   └── adrs/               # アーキテクチャ決定記録
│   │
│   ├── stories/                # ストーリー単位の作業
│   │   ├── story-000-setup/    # 初期セットアップ
│   │   │   └── vision.md
│   │   └── story-XXX-name/     # 各機能ストーリー
│   │       ├── requirement.md
│   │       ├── plan.md
│   │       ├── design.md
│   │       ├── wireframes.md   # UIワイヤーフレーム
│   │       └── context.json    # コンテキスト管理
│   │
│   └── guidelines/             # 開発ガイドライン
│       └── test-guidelines.md
│
├── src/                        # ソースコード
│   ├── app/                    # Next.js App Router
│   ├── components/             # UIコンポーネント
│   ├── lib/                    # ユーティリティ
│   └── types/                  # 型定義
│
├── tests/                      # テストコード
├── .env.example
├── README.md
└── AGENTS.md                   # AIアシスタント用メモリ
```
