# Start Here — Dola AI Drama Production Workspace

Welcome to the automated short-form drama production workspace for Dola AI and Seedance 2.5.

This clean template is structured for rapid episodic production, consistent character identity retention, and streamlined autopilot generation.

---

## Quick Navigation

1. **How to create a new series:**
   - Copy `templates/series-bible.template.md` to `series/<your-series-slug>/series-bible.md`.
   - Copy `templates/continuity.template.md` to `series/<your-series-slug>/continuity.md`.
   - Generate character sheets in `series/<your-series-slug>/characters/` using `templates/character-sheet.template.md`.

2. **How to write an episode:**
   - Create `series/<series-slug>/episodes/E001/`.
   - Write the script and storyboard using `templates/seedance-30s-scene.template.md`.
   - Review cinematography standards in `CAMERA_SHOTS_AND_ANGLE_CHOICES.md` and dramatic beats in `DRAMA_PLAYBOOK.md`.
   - Format prompts into single-line entries in `dola-queue.txt` (or `series/<series-slug>/episodes/E001/dola-queue.txt`).

3. **How to generate with Dola AI:**
   - Refer to `AUTOMATION.md`.
   - Upload your character and location references.
   - Attach `dola-queue.txt`.
   - Send the Autopilot Activation command from `templates/dola-autopilot.template.txt`.

4. **Reference reverse-engineering:**
   - Read `reverse-engineer/REVERSE_ENGINEERING_AUDIT.md` to understand how the 30-second emotional tear cliffhanger formula works.
   - Use `reverse-engineer/recognize.ps1` and `reverse-engineer/transcribe.ps1` to extract audio scripts from viral references.
