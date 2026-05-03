# Gemini API × Aiderで始めるAIコーディング環境

## TL;DR

- Google AI StudioのAPI（Gemini API）は無料枠あり・クレカ不要で使える
- AiderはターミナルベースのAIコーディングアシスタント（OSS）
- この2つを組み合わせると無料枠の範囲でAIコーディング環境を構築可能
- Windows / Mac / Linux すべてで動作（5〜15分程度でセットアップ可能）

---

## はじめに

「GitHub CopilotやClaude Codeを使いたいけど、いきなり課金はちょっと…」

そんなときに試しやすいのが、**GoogleのAPI無料枠 × OSSツール**の組み合わせです。

この記事では、**Gemini API（無料枠あり） × Aider** を使ったAIコーディング環境を紹介します。

---

## Gemma 4とは？

Google DeepMindが2026年4月2日にリリースしたオープンウェイトモデルファミリーです。Gemini 3と同じ研究・技術をベースに構築されており、Apache 2.0ライセンスで商用利用も可能です。

全体では E2B / E4B / 26B MoE / 31B Dense の4サイズが存在します。このうち **Gemini API経由で正式に利用できるモデルは以下の2つ** です。

| モデル             | 特徴                                                          |
| ------------------ | ------------------------------------------------------------- |
| gemma-4-31b-it     | 31Bの密なモデル。Arena AIオープンモデルランキング3位の性能    |
| gemma-4-26b-a4b-it | 26B MoE（実際の活性化パラメータは約4B）。推論速度が速く実用的 |

コーディングベンチマーク（LiveCodeBench v6）では80.0%というスコアを記録しています。

> **補足**: Gemma 4はGoogle AI Studio上では**Gemini API**経由で正式に提供されています。APIキーの種別やエンドポイントは「Gemini API」として扱われますが、実際に動くモデルはGemma 4です。

---

## Aiderとは？

ターミナルで動くAIコーディングアシスタントです。AIに指示を出してコードを生成・編集させるスタイルで開発を進めます。OpenAI共同創業者のAndrej Karpathyが2025年2月に提唱した「バイブコーディング」—— コードの細部をAIに委ね、意図の記述に集中する開発スタイル —— をターミナルから実践できます。

- ファイルの読み書き・編集をAIが自動で行う
- 変更をGitに自動コミットするので履歴が残る
- OpenAI / Anthropic / Gemini など多くのAPIに対応

> ⚠️ 無料枠には上限があります。「無制限に使える」わけではありません。長時間の連続利用ではレート制限に達する可能性があります。

---

## セットアップ手順

### 1. Google AI StudioでAPIキーを取得

1. [aistudio.google.com](https://aistudio.google.com) にアクセス
2. Googleアカウントでサインイン
3. 「Get API key」→「Create API key」

クレジットカード不要・無料で取得できます。

---

### 2. Aiderをvenvでインストール

**Windows:**

```cmd
python -m venv .venv
.venv\Scripts\activate
pip install aider-chat
```

**Mac / Linux:**

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install aider-chat
```

> ⚠️ Python環境が未構築の場合は時間がかかることがあります。

---

### 3. APIキーを.envファイルで管理

```env
GEMINI_API_KEY=取得したAPIキー
```

> ⚠️ `.env` は `.gitignore` に追加してください。Gitリポジトリにコミットしないよう注意してください。

---

### 4. 起動

```bash
aider --model gemini/gemma-4-31b-it --no-auto-commits
```

速度重視の場合は `gemma-4-26b-a4b-it` も選択肢です。

`.env` が読み込まれ、APIキーが自動で使われます。起動すると以下のように表示されます：

```
Aider v0.86.2
Model: gemini/gemma-4-31b-it with whole edit format
Git repo: .git with 0 files
Repo-map: using 1024 tokens, auto refresh
```

あとはチャット形式でコード生成・修正を指示するだけです。

```
> Pythonでシンプルなタスク管理CLIツールを作って
```

---

## よくある疑問

**Q. 警告が出るけど大丈夫？**

```
Warning: Unknown context window size and costs, using sane defaults.
```

Gemma 4はAiderのモデルリストに未登録のため出る警告ですが、動作に問題はありません。気になる場合は `--no-show-model-warnings` オプションを追加してください。

**Q. 無料枠はどのくらい？**

Google AI Studioの無料枠はモデルや時期によって変動します。現在のレート制限（RPM・RPD）は [Google AI Studio のダッシュボード](https://aistudio.google.com/apikey) または [公式ドキュメントのRate Limitsページ](https://ai.google.dev/gemini-api/docs/rate-limits) で確認してください。個人開発・学習用途であれば十分なレベルです。長時間の連続利用では制限に達する可能性があります。

**Q. コードはGoogleに送られる？**

はい、API経由でGoogleのサーバーに送信されます。無料枠ではデータがサービス改善に使用される可能性があります。機密コードや業務コードを扱う場合は有料ティアへの移行を検討してください。

---

## まとめ

| 項目             | 内容                                    |
| ---------------- | --------------------------------------- |
| コスト           | 無料枠あり（制限あり）                  |
| セットアップ時間 | 5〜15分（環境による）                   |
| 対応OS           | Windows / Mac / Linux                   |
| モデル性能       | LiveCodeBench v6で80.0%（トップクラス） |
| 用途             | 学習・個人開発・お試し                  |

無料・高性能・手軽なセットアップの三拍子が揃った **Gemma 4 × Aider** は、「AIコーディングツールを試してみたいけど課金はしたくない」というエンジニアにとって現時点で最も試しやすい選択肢の一つです。まずは無料枠で試してみて、気に入ったら有料ティアや他のモデルへの移行を検討してみてください。

> ※モデルの提供内容や無料枠の条件は変更される可能性があります。最新情報は公式ドキュメントをご確認ください。

---

## 参考リンク

- [Google AI Studio](https://aistudio.google.com)
- [Gemini APIでGemma 4を使う（公式）](https://ai.google.dev/gemma/docs/core/gemma_on_gemini_api)
- [Gemini API Rate Limits](https://ai.google.dev/gemini-api/docs/rate-limits)
- [Aider 公式ドキュメント](https://aider.chat/docs/install.html)
- [Gemma 4 モデル概要](https://ai.google.dev/gemma/docs/core)
