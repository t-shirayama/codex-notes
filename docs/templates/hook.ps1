# hook template
# 目的: ドキュメント更新後に確認したい処理を追加するための雛形

param(
    [string]$EventName = "post-run"
)

Write-Host "Hook event: $EventName"
Write-Host "Example: 目次更新やリンク確認の案内をここに追加する"
