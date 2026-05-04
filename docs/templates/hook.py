#!/usr/bin/env python3
"""Codex hook template.

Reads the JSON payload Codex passes on stdin and returns optional JSON on stdout.
"""

import json
import sys


def main() -> int:
    raw_input = sys.stdin.read()
    if not raw_input.strip():
        return 0

    payload = json.loads(raw_input)
    event_name = payload.get("hook_event_name")

    if event_name == "SessionStart":
        print(
            json.dumps(
                {
                    "hookSpecificOutput": {
                        "hookEventName": "SessionStart",
                        "additionalContext": "Add session startup context here.",
                    }
                },
                ensure_ascii=False,
            )
        )
        return 0

    if event_name == "UserPromptSubmit":
        print(
            json.dumps(
                {
                    "hookSpecificOutput": {
                        "hookEventName": "UserPromptSubmit",
                        "additionalContext": "Add prompt-specific guidance here.",
                    }
                },
                ensure_ascii=False,
            )
        )
        return 0

    # Plain stdout is ignored for PreToolUse / PermissionRequest / PostToolUse.
    # Return event-specific JSON only when you need to warn, block, or add context.
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
