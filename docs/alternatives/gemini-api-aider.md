# Gemini API × Aiderで始めるAIコーディング環境

## TL;DR

- Google AI StudioのAPIは無料枠があり、試し始めやすい
- AiderはターミナルベースのAIコーディングアシスタント
- Codex以外の選択肢を比較したいときの入門候補になる

## どんな人向けか

- まずは無料枠でAIコーディングを試したい
- ターミナル中心の運用に慣れている
- Codex以外の体験も比較したい

## セットアップ概要

### 1. APIキーを取得する

- Google AI Studio にアクセスする
- APIキーを発行する

### 2. Aiderをインストールする

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

### 3. 環境変数を設定する

```env
GEMINI_API_KEY=取得したAPIキー
```

### 4. 起動する

```bash
aider --model gemini/gemma-4-31b-it --no-auto-commits
```

## Codexとの見比べポイント

- Codexは `AGENTS.md` や Planモードを含む運用設計がしやすい
- AiderはCLI中心で軽く試しやすい
- どちらも「毎回の指示」より「運用ルール」を整えた方が安定する

## 具体例

まずはAiderで `READMEを更新して` のような小タスクを試し、次にCodexで `AGENTS.md を整備して` と依頼すると、ツールごとの得意不得意を比較しやすくなります。

## 参考元

このページは以下の参考元に基づいて整理しています。未確認の推測は含めていません。

- [Google AI Studio](https://aistudio.google.com)
- [Gemini APIでGemmaを使う](https://ai.google.dev/gemma/docs/core/gemma_on_gemini_api)
- [Gemini API Rate Limits](https://ai.google.dev/gemini-api/docs/rate-limits)
- [Aider 公式ドキュメント](https://aider.chat/docs/install.html)
