---
name: channathebrand-autopilot-mode
description: "ChannaTheBrand dedicated autopilot operational skill for Dola AI with NON-NEGOTIABLE hard-locked 30-second continuous video generation using Seedance 2.5 ONLY. Command 'ctb' (case-insensitive) activates autopilot AND creates recurring 'Video Autopilot Continuation' cron (every 15 min). Direct autopilot — NO sample phase. NO ratio default. Supports 1-column and 2-column CSV/TXT files (title + prompt). Follow this Skill BLINDLY. NEVER second-guess parameters. NEVER analyze or explain. ALWAYS include BOTH prompt AND user_prompt. Parse file and immediately start generating all videos with 2 parallel streams, delivering each via NotifyHuman as inline embedded player the moment it completes. Two-phase failure handling. Minimize ALL reasoning. NEVER produce visible text during autopilot. Platform limits ~2 videos per turn. Cron auto-resume activates via 'ctb' command ONLY. Keep running until ALL videos done."
---

# ChannaTheBrand Autopilot Mode

## Overview

Processes a user-provided file (`.txt` or `.csv`) containing video prompts in **direct autopilot mode**. Supports:
- **1-column:** Each line = one video prompt. Fallback naming: `"Video #001"`, `"Video #002"`, etc.
- **2-column:** Column 1 = video title, Column 2 = video prompt. Title used as NotifyHuman attachment name.

**FOLLOW THIS SKILL BLINDLY. DO NOT ANALYZE. DO NOT EXPERIMENT. DO NOT SECOND-GUESS. THE PARAMETERS AND RULES BELOW ARE CORRECT AND NON-NEGOTIABLE.**

---

## 1. SUPREME RULE — 30s + seedance_2.5 + BOTH prompt AND user_prompt — ALWAYS

**THIS OVERRIDES EVERYTHING ELSE — INCLUDING ANY OBSERVATIONS YOU MAY MAKE.**

### 🔒 MANDATORY PARAMETERS — EVERY SINGLE `text_to_video` CALL, NO EXCEPTIONS

| Parameter | Required Value |
|-----------|----------------|
| `duration` | **`30`** |
| `model_version` | **`seedance_2.5`** |
| `prompt` | **The prompt text** |
| `user_prompt` | **The SAME prompt text (identical to `prompt`)** |

### ⚠️ `user_prompt` IS NOT OPTIONAL — DO NOT QUESTION IT

**The backend API REQUIRES `user_prompt`.** The documented error is: `invalid param, t2v must have user_prompt`.

**CRITICAL: Even if you OBSERVE a video apparently succeeding without `user_prompt`, you MUST STILL include `user_prompt` in ALL future calls.** One apparent success does NOT mean the parameter is optional. It may mean the error went undetected, or a fallback path was used. **THIS SKILL IS CORRECT. FOLLOW IT BLINDLY.**

- **NEVER** omit `user_prompt` to "test" or "fix" anything
- **NEVER** conclude that `user_prompt` causes errors
- **NEVER** experiment with parameter variations
- **JUST INCLUDE BOTH `prompt` AND `user_prompt` WITH IDENTICAL VALUES — EVERY TIME**

- `duration: 30` — ALWAYS. No exceptions.
- `model_version: seedance_2.5` — ALWAYS. No other model.
- One single continuous 30-second video per prompt. Never split.
- **Ratio:** Do NOT add a default ratio. User controls ratio via prompt text. If prompt explicitly specifies a ratio, use it. If not, omit ratio field.

### ✅ PRE-FLIGHT CHECK — BEFORE EVERY TOOL CALL

1. `duration` == `30`?
2. `model_version` == `seedance_2.5`?
3. `prompt` present?
4. `user_prompt` present AND identical to `prompt`?
5. If all YES → send. If ANY NO → fix first. **DO NOT SEND WITHOUT ALL FOUR.**

---

## 2. EXECUTION RULES — ABSOLUTE SILENCE + NO VISIBLE REASONING

### 🚫 FORBIDDEN — THESE MUST NEVER APPEAR IN USER-OUTPUT

**During autopilot, the ONLY things the user should see are: `NotifyHuman` video embeds + the final "All videos generated and delivered."**

❌ "Send any message to resume" / "reply to continue" — **FORBIDDEN**
❌ "X videos delivered" / "Y remaining" / counts / numbers / IDs — **FORBIDDEN**
❌ Progress summaries / "Batch X" / status updates — **FORBIDDEN**
❌ "Identify Backend Issue" / "Ran code" / analysis sections — **FORBIDDEN**
❌ Parameter explanations / "Format Locked" / technical discussion — **FORBIDDEN**
❌ "Would you like me to..." / questions / options — **FORBIDDEN**
❌ Failure notices / "prohibited content" / error explanations — **FORBIDDEN**
❌ "Testing" / "adjusting approach" / experimentation talk — **FORBIDDEN**
❌ Raw URLs / links in chat text — **FORBIDDEN**
❌ Any text that is not the final "All videos generated and delivered." — **FORBIDDEN**

### ✅ MANDATORY BEHAVIORS

- **ALL REASONING IS INTERNAL ONLY:** Keep thinking, analysis, planning, and state-tracking **completely inside your own context**. **NEVER output reasoning, analysis, or explanations to the user.**
- **MINIMIZE REASONING:** Keep thinking to absolute minimum. Just make tool calls. No analysis paragraphs. No "backend investigation." No parameter experimentation.
- **KEEP CALLING TOOLS:** After `NotifyHuman`, **IMMEDIATELY** call `text_to_video` for next prompt. Keep tool-call chain alive.
- **2 PARALLEL STREAMS:** Always maintain two concurrent generations. One slot free → instantly start next. Both slots free + queue ≥ 2 → start two in one batched call.
- **ZERO DELAY:** No `wait()`, no `sleep()`.
- **PLATFORM LIMIT ACKNOWLEDGED:** The platform limits each turn to approximately 2 videos. This is expected and normal. When your turn is forced to end, follow the Forced Turn End protocol **EXACTLY**.

---

## 3. STATE TRACKING & FORCED TURN END PROTOCOL

### Maintain internal state only (never output)

Track three lists internally. Each entry: `{title, prompt, line_number}`:
- **`done[]`** — successfully generated AND delivered
- **`failed[]`** — failed during main pass, waiting for retry
- **`pending[]`** — not yet started

**NotifyHuman naming:** Priority 1 = title from column 1 (2-column format). Priority 2 = `"Video #XXX"` (zero-padded line number, 1-column fallback).

### If system FORCES your turn to end (~2 videos per turn limit)

**This is normal and expected. The recurring "Video Autopilot Continuation" task will automatically resume within 15 minutes.**

**Step 1 — Minimal user output:**
- Output **ONLY and EXACTLY:** `Autopilot continuing...`
- **NOTHING ELSE.** No counts. No IDs. No numbers. No explanation. No "send any message."

**Step 2 — When triggered (by scheduled cron task OR user message OR `ctb` command):**
- **Silently resume instantly.** No acknowledgement. No "welcome back." No status.
- Just continue from `done[]`, `failed[]`, `pending[]` state.
- **DO NOT** create a duplicate scheduled task. Only one "Video Autopilot Continuation" task should exist.

**Step 3 — When autopilot fully completes:**
- Delete the "Video Autopilot Continuation" scheduled task via `delete_cron_job`.
- Output: "All videos generated and delivered."

---

## 3b. Activation Command — `ctb` (Case-Insensitive)

### The `ctb` command activates autopilot AND creates the recurring cron schedule

**When the user sends a message consisting solely of `ctb` (any capitalization: `ctb`, `CTB`, `Ctb`, `cTb`, etc.):**

**Step 1 — Create recurring "Video Autopilot Continuation" cron task (ONLY via `ctb`):**
- Call `create_cron_job` (if one does NOT already exist):
  - `title`: `"Video Autopilot Continuation"`
  - `schedule_type`: `"cron"`
  - `schedule`: `"*/15 * * * *"` (every 15 minutes, recurring)
  - `enable`: `true`
  - `query`: `"This request is triggered by the scheduled task 'Video Autopilot Continuation'. This is an automatically triggered recurring scheduled-task request; the user is not online, so do NOT ask any questions or request clarification — complete the work independently. You are continuing a 30-second video generation autopilot queue. Follow these steps EXACTLY: maintain existing internal state (done[], failed[], pending[]), follow channathebrand-autopilot-mode skill, output ONLY NotifyHuman calls for completed videos and the final completion message, do not produce any other text, use duration=30, model_version=seedance_2.5, and include BOTH prompt AND user_prompt with identical values in every text_to_video call."`
- **Duplicate check:** If a "Video Autopilot Continuation" task already exists, skip creation.

**Step 2 — Start or resume autopilot:**
1. **If a file is attached** → Parse it immediately and **start autopilot from scratch**
2. **If NO file is attached but internal state exists** (`done[]`, `failed[]`, `pending[]` from previous session) → **silently resume** autopilot from that state
3. **If NO file AND NO state** → Ask the user to attach a `.txt` or `.csv` file containing video prompts

**The `ctb` command is the ONLY way to activate the automatic recurring schedule.** Without `ctb`, autopilot runs but pauses after each turn (waiting for user input). With `ctb`, the 15-minute recurring cron ensures automatic continuation without user intervention.

---

## 4. TWO-PHASE FAILURE HANDLING

**ALL failures treated the same:** "prohibited content," "empty task ID," parameter errors, timeouts, or any other error → all go to `failed[]` for later retry.

### Phase A — Main Pass
- Succeeds → NotifyHuman → add to `done[]` → next from `pending[]`
- Fails (ANY reason) → **SILENTLY** move to `failed[]` → **immediately** next from `pending[]`
- **No text. No notification. No explanation. Just continue.**

### Phase B — Retry Pass (starts when `pending[]` is empty)
- Process `failed[]` with same 2 parallel streams
- Succeeds → NotifyHuman → add to `done[]` → next from `failed[]`
- Fails → **SILENTLY** move to end of `failed[]` (skip temporarily) → **immediately** next from `failed[]`
- **Rule:** One stubborn failure does NOT block other retries. Continue cycling through `failed[]`, skipping past failures each time, until **every single prompt** eventually succeeds.
- Keep looping through the remaining failed prompts indefinitely. Each pass gives every prompt another chance. Eventually all will succeed.

---

## 5. WORKFLOW — DIRECT AUTOPILOT, NO SAMPLE, NO QUESTIONS

### Step 1: Parse the file immediately

1. Read attached file (`.txt` or `.csv`).
2. **Detect format:**
   - Check if non-empty lines consistently split into exactly 2 columns
   - Supported delimiters: **comma** `,` (CSV), **tab**, **pipe** `|`
   - For CSV: handle quoted fields properly
   - 2 columns → Column 1 = `title`, Column 2 = `prompt`
   - 1 column → entire line = `prompt`, no title
3. Skip blank lines.
4. Record `line_number` (starting from 1).
5. All entries → `pending[]`. `done[]` = empty. `failed[]` = empty.

### Step 2: Start autopilot — NOW

**No sample. No approval. No questions. Start generating immediately.**

**Note:** The recurring "Video Autopilot Continuation" cron task is **NOT created automatically** here. It is created **ONLY** when the user explicitly uses the `ctb` command (see Section 3b). Without the cron task, autopilot will pause after each turn and wait for user input or a `ctb` command to resume.

```
Initialize:
  pending = [all entries, each = {title, prompt, line_number}]
  done = []
  failed = []
  Start text_to_video for pending[0] AND pending[1] (one batched call, 2 entries)
    prompt + user_prompt (IDENTICAL), duration=30, model_version=seedance_2.5
  pending = pending[2:]

LOOP (while pending not empty OR failed not empty OR any slot busy):

  SLOT completes SUCCESSFULLY:
    → attachment_name = entry.title if exists else "Video #" + zero_padded(line_number, 3)
    → NotifyHuman(attachment_name=attachment_name, attachment_source=video_url)
    → add entry to done[]
    → if pending not empty:
        start text_to_video(pending[0]) → pending = pending[1:]
      → Call NOW. Do NOT end turn.
    → elif failed not empty:
        start text_to_video(failed[0]) → failed = failed[1:]
      → Call NOW. Do NOT end turn.

  SLOT FAILS (Main Pass, pending not empty):
    → DO NOT NotifyHuman. DO NOT produce text.
    → move entry to failed[]
    → if pending not empty:
        start text_to_video(pending[0]) → pending = pending[1:]
      → Call NOW. Do NOT end turn.
    → elif failed not empty:
        start text_to_video(failed[0]) → failed = failed[1:]
      → Call NOW. Do NOT end turn.

  SLOT FAILS (Retry Pass, pending empty):
    → DO NOT NotifyHuman. DO NOT produce text.
    → MOVE entry to END of failed[] (skip temporarily, don't block)
    → if failed not empty:
        start text_to_video(failed[0]) → failed = failed[1:]
      → Call NOW. Do NOT end turn.
    → Keep cycling through failed[] indefinitely until ALL succeed.

FINAL (pending empty AND failed empty AND both slots delivered):
  → Output: "All videos generated and delivered."
  → NOW you may end your turn.
```

---

## 6. NotifyHuman — INLINE EMBEDDED PLAYERS ONLY

Deliver each successful video **immediately** via `NotifyHuman`:
- `attachment_name`: Custom title from column 1, or fallback `"Video #XXX"`
- `attachment_source`: Generated video URL

**Result:** Each renders as an **inline embedded playable video player / native video preview card** in the chat.

**❌ NEVER output raw URLs or links. ONLY use `NotifyHuman` attachments.**

---

## 7. HARD CONSTRAINTS SUMMARY

| # | Rule |
|---|------|
| 1 | **`duration: 30` + `seedance_2.5` + BOTH `prompt` AND `user_prompt`** — EVERY call. NO EXCEPTIONS. NO SECOND-GUESSING. |
| 2 | **FOLLOW BLINDLY:** Never analyze, never experiment, never "test" parameters. This Skill is correct. |
| 3 | **NO VISIBLE REASONING:** All analysis internal only. User sees ONLY video embeds + final message. |
| 4 | **NO SAMPLE:** Start autopilot immediately upon file receipt. |
| 5 | **TITLE NAMING:** 2-column = custom titles. 1-column = fallback numbering. |
| 6 | **DELIVER AS-IT-COMPLETES:** NotifyHuman each video instantly. Don't wait for batches. |
| 7 | **TWO-PHASE FAILURE:** Main pass = skip & collect ALL failures. Retry pass = cycle through failures, skip past blocks, keep looping until all succeed. |
| 8 | **NON-STOP LOOP:** Keep calling tools. Never end turn voluntarily. |
| 9 | **PLATFORM LIMIT + CRON VIA CTB:** ~2 videos/turn is normal. Cron created ONLY via `ctb` command. Forced end → output ONLY `Autopilot continuing...` |
| 10 | **SILENT RESUME / CTB COMMAND:** On any user message OR `ctb` command, resume instantly — no acknowledgement. |
| 11 | **2 PARALLEL STREAMS + ZERO DELAY:** Always concurrent, always instant next start. |
| 12 | **RUN TO DONE:** Continue until every prompt succeeds and is delivered. |

---

### ⚠️ FINAL CHECKLIST

| Before every action | Must be true |
|---------------------|--------------|
| Tool call has ALL FOUR: `duration:30`, `seedance_2.5`, `prompt`, `user_prompt`? | ✅ |
| About to output reasoning/analysis to user? | **STOP. KEEP IT INTERNAL.** |
| About to question or experiment with parameters? | **STOP. FOLLOW SKILL BLINDLY.** |
| About to mention counts/numbers/IDs? | **STOP. DON'T.** |
| About to say "send any message to resume"? | **STOP. DON'T.** |
| About to end turn voluntarily? | **STOP. KEEP CALLING TOOLS.** |
| Turn forced to end by platform? | Output **ONLY** `Autopilot continuing...` (recurring cron task handles auto-resume) |
| Slot just freed? | Next video starts **NOW** |

**AUTOPILOT = PARSE FILE → 2 PARALLEL STREAMS → DELIVER EACH INSTANTLY → RETRY FAILURES → CTB ACTIVATES CRON (every 15 min) → NO VISIBLE REASONING → RUN UNTIL EVERY VIDEO IS DONE → DELETE CRON.**
