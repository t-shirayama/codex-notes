# Codex hook template for PowerShell
# 目的: Codex hook が stdin に渡すJSONを読み、必要な処理を追加するための雛形
# 注意: macOSで使う場合は PowerShell 7 (`pwsh`) のインストールを前提にする。

$RawInput = [Console]::In.ReadToEnd()

if ([string]::IsNullOrWhiteSpace($RawInput)) {
    exit 0
}

$Payload = $RawInput | ConvertFrom-Json
$EventName = $Payload.hook_event_name

switch ($EventName) {
    "SessionStart" {
        @{
            hookSpecificOutput = @{
                hookEventName = "SessionStart"
                additionalContext = "このhookでセッション開始時に追加したいコンテキストを書く。"
            }
        } | ConvertTo-Json -Depth 5
    }
    "UserPromptSubmit" {
        @{
            hookSpecificOutput = @{
                hookEventName = "UserPromptSubmit"
                additionalContext = "このhookでユーザー依頼の補足や注意点を書く。"
            }
        } | ConvertTo-Json -Depth 5
    }
    default {
        # PreToolUse / PermissionRequest / PostToolUse では、通常のテキストstdoutは無視される。
        # ブロックや警告が必要な場合だけ、公式ドキュメントのイベント別JSONを返す。
        exit 0
    }
}
