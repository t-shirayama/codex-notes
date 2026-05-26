# Codex CLIスラッシュコマンド

> - 種別: official
> - 参考元: [Slash commands in Codex CLI](https://developers.openai.com/codex/cli/slash-commands)
> - 最終ファクトチェック: 2026-05-26
> - 確認メモ: 組み込みスラッシュコマンドの一覧、実行中タスクへのキュー、主要コマンドの使いどころを確認

## 概要

Codex CLIのスラッシュコマンドは、ターミナルからCodexの挙動を素早く切り替えるための操作です。入力欄で `/` を入力するとコマンド候補が開き、モデル変更、権限変更、会話の圧縮、差分確認、MCPやhooksの確認などを会話の流れの中で実行できます。

長い作業では、毎回プロンプトで状態を説明し直すより、`/status`、`/permissions`、`/compact`、`/diff` のようなコマンドを挟む方が安定します。CLIを日常運用する人は、まず「状態を見る」「権限を切り替える」「文脈を渡す」「作業を分岐する」コマンドから覚えると使いやすくなります。

## 基本の使い方

1. Codex CLIの入力欄で `/` を入力する。
2. 候補リストからコマンドを選ぶか、コマンド名を入力して絞り込む。
3. 必要な引数を付けて実行する。

タスクがすでに実行中の場合でも、スラッシュコマンドを入力して `Tab` を押すと、次のターン用にキューできます。キューされたコマンドは現在のターンが終わったあとに解析されるため、メニューやエラー表示もそのタイミングで出ます。

`/quit` と `/exit` はどちらもCLIを終了します。重要な変更を保存またはコミットしてから使います。

## コマンド一覧

| コマンド | 何をするか | 使いどころ |
| --- | --- | --- |
| `/permissions` | Codexが確認なしで実行できる範囲を設定する | セッション途中でAuto、Read Onlyなどの承認要件を切り替える |
| `/ide` | 開いているファイル、選択範囲などのIDEコンテキストを次のプロンプトに含める | IDEで見ている内容を説明し直さずCodexに渡す |
| `/keymap` | TUIのキーボードショートカットを確認・変更・保存する | `config.toml` にカスタムキー設定を永続化する |
| `/vim` | 入力欄のVimモードを切り替える | Vim風のnormal/insert操作と通常編集を切り替える |
| `/sandbox-add-read-dir` | Windowsで追加ディレクトリの読み取りをsandboxに許可する | readable roots外の絶対パスを読む必要があるコマンドを通す |
| `/agent` | 有効なagent threadを切り替える | spawnされたsubagentの作業を確認・継続する |
| `/apps` | apps(connector)を参照し、プロンプトに挿入する | `$app-slug` としてappを指定してCodexに使わせる |
| `/plugins` | インストール済み・検出可能なpluginを参照する | pluginの機能確認、インストール候補の確認、有効状態の管理をする |
| `/hooks` | lifecycle hookを確認・管理する | 読み込まれたhook、信頼状態、無効化状態を確認する |
| `/clear` | ターミナル表示を消し、新しいチャットを開始する | 同じCLIセッション内で見た目と会話をまとめてリセットする |
| `/compact` | 会話を要約してコンテキストを節約する | 長い作業のあと、重要点を残してトークン使用量を抑える |
| `/copy` | 最新の完了済みCodex出力をクリップボードにコピーする | 直近の回答や計画を手動選択なしで取り出す |
| `/diff` | Git差分を表示する | Codexの編集内容や未追跡ファイルを確認してから検証・コミットする |
| `/exit` | CLIを終了する | `/quit` と同じ。作業保存後に使う |
| `/experimental` | 実験的機能を切り替える | subagentsなど任意機能をCLIから有効化・無効化する |
| `/approve` | auto reviewで拒否された直近の操作を1回だけ再試行承認する | 自動レビューが止めた操作を、内容確認後に再試行する |
| `/memories` | memoriesの利用や生成を設定する | memory injectionやmemory generationをオン・オフする |
| `/skills` | skillsを参照し、使うskillを選ぶ | タスク専用のローカルskillを次の依頼に適用する |
| `/feedback` | Codex maintainersへログや診断情報を送る | 不具合報告やサポート用の診断共有をする |
| `/init` | 現在のディレクトリに `AGENTS.md` の雛形を生成する | リポジトリやサブディレクトリ用の永続指示を作り始める |
| `/logout` | Codexからサインアウトする | 共有端末などでローカル認証情報を消す |
| `/mcp` | 設定済みMCP toolsを一覧する | そのセッションでCodexが呼べる外部ツールを確認する |
| `/mention` | ファイルやフォルダを会話に添付する | 次の依頼で見てほしい対象を明示する |
| `/model` | 有効モデルと、対応していればreasoning effortを選ぶ | タスク前に軽量モデルや深い推論モデルへ切り替える |
| `/fast` | 対応モデルのFast service tierを切り替える | Fast tierのオン・オフ、または現在状態の確認をする |
| `/plan` | plan modeに切り替え、必要なら同時に依頼文を送る | 実装前に計画を出してほしいときに使う |
| `/goal` | タスクgoalを設定・表示・一時停止・再開・削除する | 長い作業でCodexに継続目標を持たせる |
| `/personality` | 返答のコミュニケーションスタイルを選ぶ | プロンプトを書き換えずに応答傾向を変える |
| `/ps` | 実験的なbackground terminalsと直近出力を表示する | 長時間コマンドの進行状況をメイン画面から確認する |
| `/stop` | background terminalsを停止する | 現在セッションが起動したバックグラウンド作業を止める |
| `/fork` | 現在の会話を新しいthreadへ複製する | いまの履歴を残したまま別案を試す |
| `/side` | 一時的なside conversationを開始する | メイン作業を崩さず、短い確認や別観点の相談をする |
| `/raw` | raw scrollback modeを切り替える | 長い出力を選択・コピーしやすくする |
| `/resume` | 保存済み会話を再開する | 以前のCLIセッションから作業を続ける |
| `/new` | 同じCLIセッション内で新しい会話を開始する | CLIを閉じずに別タスクを新しい文脈で始める |
| `/quit` | CLIを終了する | `/exit` と同じ。作業保存後に使う |
| `/review` | working treeのレビューをCodexに依頼する | 実装後やコミット前にバグ・リスク・テスト漏れを確認する |
| `/status` | セッション設定とトークン使用量を表示する | モデル、承認ポリシー、writable roots、残りコンテキストを確認する |
| `/debug-config` | config layerとrequirements診断を表示する | `config.toml` と実効設定が違う理由を調べる |
| `/statusline` | TUI footerに出す項目を設定する | model、context、git、token、sessionなどを表示・並べ替えする |
| `/title` | ターミナルのwindow/tab title項目を設定する | project、status、thread、branch、model、進捗などをタイトルに出す |
| `/theme` | シンタックスハイライトのthemeを選ぶ | 端末表示のコード色をpreviewして永続化する |

## よく使う運用パターン

### 状態を確認する

作業の前後では `/status` を使うと、現在のモデル、承認ポリシー、書き込み可能なroot、コンテキスト使用量を確認できます。設定の効き方が想定と違うときは `/debug-config` を使い、config layerの順序やpolicy sourceを見ます。

```txt
/status
/debug-config
```

### 権限を切り替える

大きな編集を任せる前は `/permissions` で承認モードを確認します。慎重に進めたい調査ではRead Only寄り、反復実装ではAuto寄りにするなど、作業の危険度に合わせて切り替えます。

```txt
/permissions
```

auto reviewで拒否された操作を内容確認のうえ1回だけ再試行したい場合は `/approve` を使います。これは承認要件を恒久的に緩めるためではなく、直近の拒否を再試行するためのコマンドです。

### モデルと応答スタイルを変える

`/model` は有効モデルを切り替えます。対応している場合はreasoning effortも選べます。`/fast` はモデルカタログ上でFast tierが公開されている場合だけ表示され、`/fast on`、`/fast off`、`/fast status` のように使います。

```txt
/model
/fast status
/personality
```

`/personality` はプロンプトを書き換えずに、Codexの返答スタイルを変更します。公式ドキュメントでは `friendly`、`pragmatic`、`none` が示されています。対象モデルがpersonality-specific instructionsに対応していない場合、このコマンドは表示されません。

### 作業前に計画を出す

実装前に方針を確認したいときは `/plan` を使います。インラインで依頼文を付けることもできます。

```txt
/plan このサービス移行の作業計画を出して
```

タスクがすでに実行中の場合、`/plan` は一時的に使えません。

### 長い作業の目標を固定する

`/goal` は現在のthreadに継続目標を付けます。目標は空にできず、最大4,000文字です。長い指示はファイルに書き、そのファイルを参照する形にします。

```txt
/goal 移行を完了し、既存テストを通した状態にする
/goal
/goal pause
/goal resume
/goal clear
```

### 文脈を渡す

IDEで開いているファイルや選択範囲を次の依頼に含めたいときは `/ide` を使います。特定ファイルを明示したい場合は `/mention` を使います。

```txt
/ide この選択範囲をリファクタして
/mention docs/operations/mcp.md
```

MCP toolsを確認する場合は `/mcp`、詳細なserver diagnosticsまで見たい場合は `/mcp verbose` を使います。appsやpluginsを使う作業では `/apps`、`/plugins` から候補を確認できます。

### 会話を整理する

長くなった会話は `/compact` で要約し、重要点を残しながらコンテキストを節約します。見た目と会話をまとめて新しくしたい場合は `/clear`、同じCLI内で新しい会話だけ始めたい場合は `/new` を使います。

```txt
/compact
/clear
/new
```

`Ctrl+L` は画面表示だけを消し、現在のchatは維持します。`/clear` は新しい会話を始める点が違います。

### 変更を確認する

Codexの編集後は `/diff` でGit差分を確認します。動作やテスト漏れの観点で見直したい場合は `/review` を使います。

```txt
/diff
/review
```

`/review` はworking treeの変更に対して、挙動の変化、バグ、テスト不足を中心に確認します。差分の細部を自分でも見る場合は、続けて `/diff` を使います。

`/stop` には `/clean` というaliasもあります。

### 会話を分岐する

別案を試すときは `/fork` で現在の会話を新しいthreadに複製します。メイン作業を中断せず短い確認をしたい場合は `/side` を使います。

```txt
/fork
/side この計画に明らかなリスクがあるか確認して
```

`/side` はside conversationの中やreview mode中には使えません。

### hooksやskillsを確認する

`/skills` はローカルskillを選んで次の依頼に適用します。`/hooks` は現在セッションに読み込まれたlifecycle hooksを確認し、非管理hookの信頼、無効化、再有効化を扱います。

```txt
/skills
/hooks
```

hook設定を変更した直後やplugin由来のhookがある場合は、`/hooks` で読み込み元と信頼状態を確認してから作業を進めます。

## Windowsでの読み取り許可追加

`/sandbox-add-read-dir` は、Codex CLIをWindows nativeで実行しているときだけ使えるコマンドです。既存のsandbox readable roots外にある絶対パスを読む必要がある場合に、追加の読み取り許可を付けます。

```txt
/sandbox-add-read-dir C:\absolute\directory\path
```

指定するパスは既存の絶対ディレクトリである必要があります。実行後、CodexはWindows sandbox policyを更新し、その後のsandbox内コマンドで対象ディレクトリを読めるようにします。

## 具体例

長い修正作業をCLIで進める場合は、次の流れにすると状態が追いやすくなります。

1. `/status` で現在のモデル、承認ポリシー、作業ディレクトリを確認する。
2. 必要なら `/permissions` で承認モードを調整する。
3. `/plan 修正方針を出して` で実装前の方針を確認する。
4. 作業が長くなったら `/compact` で会話を圧縮する。
5. 編集後に `/diff` で差分を確認する。
6. コミット前に `/review` でworking treeレビューを依頼する。

スラッシュコマンドは、Codexに「今どう動いてほしいか」を短い操作で伝えるための道具です。コマンドそのものを覚えるだけでなく、作業の節目で状態確認や差分確認を挟む運用にすると、CLIでの長時間作業が安定します。

## 参考元

このページは以下の参考元に基づいて整理しています。未確認の推測は含めていません。

- [Slash commands in Codex CLI](https://developers.openai.com/codex/cli/slash-commands)
