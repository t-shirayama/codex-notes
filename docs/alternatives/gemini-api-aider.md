# Gemini API × Aiderで始めるAIコーディング環境

> - 種別: curation
> - 参考元: [Google AI Studio](https://aistudio.google.com), [Run Gemma with the Gemini API](https://ai.google.dev/gemma/docs/core/gemma_on_gemini_api), [Gemini API Rate Limits](https://ai.google.dev/gemini-api/docs/rate-limits), [Aider Installation](https://aider.chat/docs/install.html), [Aider Gemini](https://aider.chat/docs/llms/gemini.html)
> - 最終ファクトチェック: 2026-05-08
> - 確認メモ: Aiderの現行インストール手順、Gemini APIキー設定、Gemma 4対応モデル、無料枠の表現を確認

## TL;DR

- Google AI Studio / Gemini API には Free tier があり、試し始めやすい
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

現在のAider公式ドキュメントでは、`aider-install` を使う方法が最初に案内されています。

```bash
python -m pip install aider-install
aider-install
```

`pip` で入れる場合は、仮想環境を使って依存関係を分けます。

```bash
python -m pip install -U --upgrade-strategy only-if-needed aider-chat
```

### 3. 環境変数を設定する

```env
GEMINI_API_KEY=取得したAPIキー
```

### 4. 起動する

```bash
aider --model gemini --no-auto-commits
```

Aider公式ドキュメントでは、Gemini用のショートカットとして `aider --model gemini` が案内されています。Gemmaを直接試したい場合、GoogleのGemma公式ドキュメントでは Gemini API が `gemma-4-31b-it` と `gemma-4-26b-a4b-it` をサポートすると説明されています。Aider側で利用可能なモデル名は次のコマンドで確認します。

```bash
aider --list-models gemini/
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
- [Run Gemma with the Gemini API](https://ai.google.dev/gemma/docs/core/gemma_on_gemini_api)
- [Gemini API Rate Limits](https://ai.google.dev/gemini-api/docs/rate-limits)
- [Aider Installation](https://aider.chat/docs/install.html)
- [Aider Gemini](https://aider.chat/docs/llms/gemini.html)
