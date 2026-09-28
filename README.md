# Dola AI Video Production Workspace Template

Clean, production-ready starter template for automated 30-second vertical episodic drama generation powered by **Dola AI** and **Seedance 2.5**.

This repository contains all foundational workflows, cinematography standards, prompt templates, continuity rules, and automation protocols with zero project-specific content—ready to clone, customize, and push to GitHub.

---

## 📁 Repository Structure

```text
Dola 2/
├── .gitignore                          # Pre-configured rules ignoring large media and binaries
├── START_HERE.md                       # Quickstart onboarding guide
├── README.md                           # Main workspace documentation
├── STRUCTURE.md                        # Detailed project directory layout
├── PROJECT_RULES.md                    # Locked generation parameters & continuity rules
├── AUTOMATION.md                       # Dola AI autopilot protocol & prompt injection
├── DRAMA_PLAYBOOK.md                   # Narrative mechanics (Counterpoint Betrayal Engine)
├── CAMERA_SHOTS_AND_ANGLE_CHOICES.md   # Vertical cinematography & framing standards
├── project-state.json                  # Clean project state tracker
├── dola-queue.txt                      # Single-line prompt queue for Dola AI autopilot
│
├── templates/                          # Reusable production templates
│   ├── series-bible.template.md        # Series overview, logline & character cast
│   ├── continuity.template.md          # 180° axis, wardrobe, & clip chaining log
│   ├── character-sheet.template.md     # 4-view model reference prompt board
│   ├── seedance-30s-scene.template.md  # 30-second scene breakdown with 7-beat timing
│   └── dola-autopilot.template.txt     # Exact autopilot injection command for Dola AI
│
├── series/                             # Active episodic productions (created per show)
│   └── <series-slug>/
│       ├── series-bible.md
│       ├── continuity.md
│       ├── characters/                 # Character reference sheets & identity cards
│       ├── locations/                  # Environmental reference prompts
│       ├── props/                      # Key story props
│       └── episodes/<episode-id>/      # Scripts, storyboards, queues, & renders
│
├── reverse-engineer/                   # Narrative breakdown tools & audit framework
│   ├── REVERSE_ENGINEERING_AUDIT.md    # Deconstructed viral drama anatomy
│   ├── recognize.ps1                   # Local speech-to-text recognition tool
│   ├── transcribe.ps1                  # Audio transcription script
│   ├── frames/                         # Extracted reference frames (.gitkeep)
│   └── shots/                          # Extracted reference shots (.gitkeep)
│
├── sound-fx/                           # Diegetic sound effects & foley (.gitkeep)
├── bgm/                                # Background music tracks (.gitkeep)
└── scripts/                            # Automation and formatting helper scripts (.gitkeep)
```

---

## ⚡ Quickstart: Launching a New Series

### 1. Initialize Your Series
1. Create a folder under `series/<series-slug>/` (e.g., `series/broken-vows/`).
2. Copy `templates/series-bible.template.md` to `series/<series-slug>/series-bible.md`.
3. Copy `templates/continuity.template.md` to `series/<series-slug>/continuity.md`.
4. Generate 4-view character sheets for your cast using `templates/character-sheet.template.md` and save them in `series/<series-slug>/characters/`.

### 2. Write an Episode
1. Create an episode folder: `series/<series-slug>/episodes/E001/`.
2. Draft your 30-second scene prompt using `templates/seedance-30s-scene.template.md`.
3. Align the narrative with the 7-beat structure in `DRAMA_PLAYBOOK.md` and cinematography rules in `CAMERA_SHOTS_AND_ANGLE_CHOICES.md`.
4. Format prompts into single-line entries in `dola-queue.txt`.

### 3. Generate with Dola AI Autopilot
1. Upload character references (`@1`, `@2`) and environment references (`@SCENE`).
2. Attach `dola-queue.txt` in Dola AI.
3. Send the activation command from `templates/dola-autopilot.template.txt` (documented in `AUTOMATION.md`).
4. Approve the initial sample gate; Dola AI will execute the rest on autopilot with 2 concurrent workers.

---

## 🛡️ Core Rules & Parameters

* **Model:** `seedance_2.5`
* **Duration:** `30s` per clip
* **Aspect Ratio:** `9:16` vertical format
* **Framerate:** `24fps`
* **Visual Quality:** Ultra HD, Photorealistic, High Detail, Realistic Textures
* **Consistency:** Strict identity assignment (`@1`, `@2`) with negative constraints to prevent facial morphing or wardrobe switching.

See [PROJECT_RULES.md](PROJECT_RULES.md) for complete details.
