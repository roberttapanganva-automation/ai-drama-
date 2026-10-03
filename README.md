# AI Drama Video Production Workspace Template

Production-ready starter template for automated vertical episodic drama generation, cinematography standards, prompt systems, and quality assurance pipelines. Powered by **Seedance 2.5**, **Google Flow / Veo**, **Omni Flash**, **ChatGPT Automation**, and **Dola AI**.

---

## 🚀 Overview

This repository contains all canonical workflows, cinematography standards, prompt templates, continuity rules, automated QA pipelines, and production toolsets for producing high-retention vertical short dramas (9:16).

### Key Features

* **Unified Workflow Baseline (v2.3 / Tagpi Credit-Optimized):** Multi-angle coverage, beat-based ingredients, uninterrupted dialogue line preservation, and delivery-tier selection.
* **Cinematography & Prompt Standards:** Frame-by-frame vertical optical framing, 180° axis continuity, camera motions, and token-based character DNA preservation.
* **Tagalog / Filipino Drama Playbook:** Counterpoint betrayal mechanics, high-engagement hook architecture, and phonetic dictionaries for accurate AI speech synthesis.
* **Multi-Engine Video Generation:** Seamless support for Seedance 2.5 (30s scenes), Google Flow / Veo auto-handoff, Omni Flash prompt adapters, and Dola AI autopilot execution.
* **Automated QA & CLI Tooling:** Built-in schema validation, manifest lifecycle tracking, rule drift audits, and automated test suites (`node scripts/workflow.mjs`, `node --test tests/*.test.mjs`).

---

## 📁 Repository Structure

```text
ai-drama/
├── .workflow/                         # Rule change ledger & machine-readable baselines
│   ├── active-series-qa.json
│   ├── rule-changes.jsonl
│   └── rules-baseline.json
│
├── schemas/                           # Strict JSON schemas for manifest validation
│   ├── episode-v2.schema.json
│   ├── episode-v2.2.schema.json
│   └── episode-v2.3.schema.json
│
├── scripts/                           # Production automation, exporters & QA tools
│   ├── workflow.mjs                   # Main workflow CLI entry point
│   ├── production.mjs                 # Batch prompt generation & asset pipeline
│   ├── rules-qa.mjs                   # Static rule drift & conflict checker
│   ├── export-tagpi-csv.mjs           # Tagpi CSV exporter
│   ├── export-veo-csv-e001.mjs        # Veo batch exporter
│   ├── chatgpt-automation-format.mjs  # ChatGPT image prompt formatter
│   └── veo-auto-format.mjs            # Veo prompt formatter
│
├── templates/                         # Reusable production templates
│   ├── brand-kit.template.md          # Page branding & visual identity template
│   ├── continuity.template.md         # 180° axis, wardrobe, & clip chaining log
│   ├── character-sheet.template.md    # 4-view model reference prompt board
│   ├── series-bible.template.md       # Series overview, logline & character cast
│   ├── seedance-30s-scene.template.md # 30-second scene breakdown with 7-beat timing
│   ├── dola-autopilot.template.txt    # Dola AI autopilot injection prompt
│   ├── episode.template.json          # Manifest v2.3 production template
│   ├── omni-prompt.template.json      # Structured Omni Flash prompt template
│   ├── page.template.json             # Facebook page profile schema template
│   └── workflow-actions/              # Action lifecycle templates (auth, claim, retry, review)
│
├── tests/                             # Automated test suite (56 tests)
│   ├── workflow-tagpi.test.mjs        # Tagpi v2.3 workflow & manifest tests
│   ├── workflow-v22.test.mjs          # Manifest v2.2 tests
│   ├── production.test.mjs            # Production pipeline & export tests
│   └── ...
│
├── examples/                          # Reference manifest implementations
│   ├── v2.2/                          # Manifest v2.2 sample script & production JSON
│   └── v2.3/                          # Manifest v2.3 Tagpi credit-optimized sample
│
├── reverse-engineer/                  # Deconstruction tools & audio transcription
│   ├── REVERSE_ENGINEERING_AUDIT.md   # Viral drama anatomy breakdown
│   ├── recognize.ps1                  # Local speech recognition helper
│   └── transcribe.ps1                 # Audio transcription script
│
├── bgm/                               # Background music tracks (.gitkeep)
├── sound-fx/                          # Diegetic foley & SFX (.gitkeep)
├── series/                            # Active episodic productions (.gitkeep)
│
├── WORKFLOW_RULES.md                  # Canonical unified production rulebook (v2.3)
├── SCRIPTWRITING_STANDARD.md          # 7-beat episodic scriptwriting standard
├── CAMERA_SHOTS_AND_ANGLE_CHOICES.md  # Vertical cinematography & camera angles
├── DRAMA_PLAYBOOK.md                  # Narrative mechanics & hook architecture
├── AUTOMATION.md                      # End-to-end automation handoff protocols
├── CHATGPT_AUTOMATION_HANDOFF.md      # ChatGPT batch image generation handoff
├── VEO_AUTO_HANDOFF.md                # Google Veo automation handoff guide
├── GOOGLE_FLOW_OMNI_PINOY_DRAMA_ADAPTER.md # Omni Flash & Flow prompt adapter
├── TAGALOG_DIALOGUE_STANDARD.md       # Tagalog dialogue & natural phrasing rules
├── DOLA_PHONETIC_DICTIONARY.md        # AI speech phonetic pronunciations
├── CHARACTER_DNA_TOKENS.md            # Reusable character visual DNA tokens
├── project-state.json                 # Clean workspace state tracker
├── SKILL.md                           # Autopilot operational skill definition
├── seedance_30s_prompt_system.md      # Seedance 2.5 prompt crafting guide
└── dola-queue.txt                     # Prompt queue for autopilot execution
```

---

## ⚡ Quickstart

### 1. Verify Environment & Rules
Run the built-in static QA checker and test suite:
```powershell
# Run rule consistency check
node scripts/rules-qa.mjs check

# Run automated workflow tests
node --test tests/*.test.mjs
```

### 2. Launching a New Series
1. Create a series directory under `series/<series-slug>/` (e.g. `series/broken-vows/`).
2. Copy `templates/series-bible.template.md` to `series/<series-slug>/series-bible.md`.
3. Copy `templates/continuity.template.md` to `series/<series-slug>/continuity.md`.
4. Generate 4-view character reference prompts using `templates/character-sheet.template.md`.

### 3. Writing & Producing an Episode
1. Create `series/<series-slug>/episodes/E001/`.
2. Draft the script following `SCRIPTWRITING_STANDARD.md` and `DRAMA_PLAYBOOK.md`.
3. Copy `templates/episode.template.json` to configure shots, dialogue tiers, and visual actions.
4. Export image and video generation batches using `node scripts/workflow.mjs` or `node scripts/production.mjs`.

---

## 🛡️ Core Rules & Standards

* **Aspect Ratio:** `9:16` vertical video format.
* **Workflow Profile:** `tagpi_credit_optimized` (Schema v2.3).
* **Cinematography:** Multi-angle coverage for 1-reference shots, strict 180° axis preservation, and distinct camera angles per speaking turn.
* **Dialogue Preservation:** Uninterrupted spoken lines, closed-mouth listeners during offscreen speech, and phonetically verified synthesis.

Consult [WORKFLOW_RULES.md](WORKFLOW_RULES.md) for complete production requirements.
