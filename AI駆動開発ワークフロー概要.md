# AI駆動開発ワークフロー概要

> 出典: [CyberAgent Developers Blog](https://developers.cyberagent.co.jp/blog/archives/62010/)

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

## Phase0: プロジェクト構想

コードを書く前に「なぜ作るのか」「誰のために作るのか」を明確にするフェーズです。
AIにビジネス観点の質問に答えてもらい、プロジェクトの方向性を固めます。
技術的な議論はこの段階では行いません。

TODO: Phase1から作成する

## Phase1: プロジェクト初期化

プロジェクトの骨格を作るフェーズです。
AI駆動開発に最適化されたフォルダ構造と、AIが参照するメモリファイル（AGENTS.md）を生成します。
ここで定義した構造が、後続フェーズでの自動生成の基盤となります。

AGENTS.mdはAIの「長期記憶」として機能します。
プロジェクトルール、参照すべきドキュメント、現在のステータスを記載することで、AIが一貫した判断を下せるようになります。

## Phase2: 要件定義

「何を作るか」を詳細に定義するフェーズです。
ユーザーストーリー、UIワイヤーフレーム、ドメインモデルの3つを作成し、実装の土台を固めます。
技術に依存しない設計を心がけることで、後から技術選定を変更しても影響を最小限に抑えられます。

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
