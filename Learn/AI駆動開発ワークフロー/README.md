# 人間は意図、AIは実装：AI駆動開発ワークフロー まとめ

> 出典: [CyberAgent Developers Blog](https://developers.cyberagent.co.jp/blog/archives/62010/)

## 核心的なアイデア

「人間が目的地（Why）を伝え、AIが最適ルート（How）を提案して成果物（What）へ導く」というGoogle Mapsのような開発体験を目指したワークフロー。

**人間 = 要件を定義する / AI = 実装する** という明確な役割分担を作ることが狙い。

---

## 全体の流れ（6フェーズ）

| フェーズ          | 内容                                                       |
| ----------------- | ---------------------------------------------------------- |
| Phase 0: 構想     | なぜ作るかを言語化（コードを書かない）                     |
| Phase 1: 初期化   | フォルダ構造とAGENTS.mdを生成                              |
| Phase 2: 要件定義 | ユーザーストーリー・ワイヤーフレーム・ドメインモデルを作成 |
| Phase 3: 設計     | アーキテクチャと技術スタックを選定                         |
| Phase 4: 環境構築 | 「インストールして」の一言で自動セットアップ               |
| Phase 5: 実装     | 「要件はこれ」と伝えるだけでコード生成                     |

---

## 特徴的な仕組み

### 1. AGENTS.md = AIの長期記憶

プロジェクトルール・参照ドキュメント・作業ルールを記したAIのメモリ。AIが毎回一貫した判断をできるようにする。

```markdown
# Feature Request Board - AIアシスタント用メモリ

## 作業ルール

1. 計画先行: 作業前に計画を立て、承認後に実行
2. 3案提示: 計画・提案時は3つの選択肢を提示
3. 仕様書優先: 実装前に関連仕様書を確認・更新
4. context.json更新: 機能実装完了時にcontext.jsonを更新
```

### 2. context.json = 実装の進捗管理

各ストーリーに用意し、作成・変更したファイルや依存関係・完了日時を記録する。AIが過去の実装を正確に把握でき、次のストーリー実装時にも文脈を引き継げる。

```json
{
  "feature_id": "001-request-posting",
  "status": "completed",
  "new_files": ["src/components/features/request/RequestForm.tsx"],
  "modified_files": ["docs/specs/api-specs.md"],
  "related_user_stories": ["docs/stories/story-003-list-view/requirement.md"],
  "started_at": "2024-01-15T10:00:00Z",
  "completed_at": "2024-01-16T18:30:00Z"
}
```

### 3. 要件ベースプロンプト

成果物のパスをプロンプトに羅列せず、要件と参照ドキュメントだけを伝える。AIがAGENTS.mdとproject-rules.mdを参照して適切な場所に自動配置する。

---

## 実際の開発イメージ

```txt
人間: vision.md を読んでユーザーストーリーを自動生成して
AI:   分析結果を提示 → 承認後にフォルダ・ファイルを自動生成

人間: tech-stack.md を読んで環境構築して
AI:   インストール計画を提示 → 承認後に自動実行

人間: story-001 の要件で実装して
AI:   AGENTS.md・仕様書を参照 → ファイル生成 → context.json を更新
```

---

## フォルダ構成

```txt
project/
├── AGENTS.md                    # AIの長期記憶
├── docs/
│   ├── specs/                   # 仕様書（SSOT）
│   │   ├── domain-model.md
│   │   ├── api-specs.md
│   │   ├── db-schema.md
│   │   ├── glossary.md
│   │   ├── project-rules.md
│   │   └── adrs/
│   ├── stories/                 # ストーリー単位の作業
│   │   ├── story-000-setup/
│   │   │   └── vision.md
│   │   └── story-001-{name}/
│   │       ├── requirement.md
│   │       ├── wireframes.md
│   │       └── context.json    # 進捗管理
│   └── guidelines/
└── src/                         # ソースコード
```

---

## プロンプトの書き方

### Phase 0（構想）のプロンプト例

```txt
あなたの役割: 経験豊富なプロダクトストラテジスト

重要な制約:
- ソースコードは一切出力しないでください
- 技術選定・アーキテクチャの議論は行わないでください

以下の質問に答えてください:
- 解決したい課題は何ですか？
- 想定ユーザーは誰ですか？
- MVPに必要な機能は何ですか？
```

### Phase 5（実装）のプロンプト例

```txt
プロジェクトルールの参照:
- AGENTS.md: フォルダ構成、作業ルール
- docs/specs/project-rules.md: 命名規則

参照ドキュメント:
- docs/specs/domain-model.md
- docs/stories/story-001/requirement.md
- docs/stories/story-001/wireframes.md

要件:
1. requirement.md の受け入れ基準を満たす実装を行う
2. TDDで実装（テストファースト）
3. 実装完了後、context.json を更新
```

---

## メリット・注意点

| メリット                         | 注意点                                   |
| -------------------------------- | ---------------------------------------- |
| プロンプトが短くなる             | 事前のAGENTS.md整備に時間がかかる        |
| ファイル配置が一貫する           | context.jsonの更新を忘れると管理が崩れる |
| 要件と実装がトレースできる       | 小規模向け（大規模には調整が必要）       |
| AIが過去の実装を正確に把握できる | フェーズごとの承認ステップが必要         |
