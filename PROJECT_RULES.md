# Project Rules & Standards

## 1. Locked Seedance 2.5 Generation Parameters
* **Model:** `seedance_2.5`
* **Duration:** `30s` per clip
* **Aspect Ratio:** `9:16` vertical format
* **Framerate:** `24fps`
* **Visual Quality:** Ultra HD, Photorealistic, High Detail, Realistic Textures

## 2. Character & Environment Consistency
1. **Never generate a scene without assigned identity references.**
   * `@1 = Character A` -> controlled by `CHAR-xxx-identity.png`
   * `@2 = Character B` -> controlled by `CHAR-xxx-identity.png`
   * `@SCENE = Continuity Frame` -> controlled by `CONT-Clip-xx-final-frame.png`
2. **Explicit Assignment Rules:** Always include:
   * `[IMAGE 1] controls @1 only.`
   * `[IMAGE 2] controls @2 only.`
   * `Do not merge identities or blend facial features.`
3. **No Morphing:** Enforce strict negative constraints (no wardrobe switches, no face morphing, no teleporting, no extra limbs).

## 3. Physical Action & Spatial Geography
* Follow the physical chain: `CAUSE -> CONTACT -> REACTION -> RECOVERY`.
* Maintain the 180-degree camera axis across all clips in a sequence.
* Screen direction is locked for the duration of the scene.

## 4. Dola AI Queue Integrity
* When formatting `dola-queue.txt`, each clip must be on a **single non-empty line**.
* Frozen character/location blocks must be kept byte-identical across the episode queue.
