# Automation: Dola AI Production Protocol

This document details the automated prompt injection and execution protocol for Dola AI.

---

## 1. Master Autopilot Execution Block

When dispatching a batch to Dola AI:
1. Upload the identity reference images from `characters/`, `locations/`, and `props/`.
2. Attach the generated `dola-queue.txt` file from the target episode folder (`episodes/E001/dola-queue.txt`).
3. Send the exact prompt below:

```text
STRICTLY ACTIVATE AUTOPILOT MODE. You must work non-stop, without pause or
termination, from start to end until every single video from the attached .txt
file has been generated and delivered. The ONLY allowed interruption is the
single sample gate below.
SAMPLE GATE: Read the attached .txt file (one prompt per non-empty line; skip
blank lines). Take the FIRST line, generate exactly ONE sample video, deliver
it via NotifyHuman as a video attachment, then STOP and wait for my explicit
approval. Generate nothing else before approval. This checkpoint is the ONLY
confirmation I will ever give; after approval, ask no questions and request no
clarifications.
AUTOPILOT (engages immediately after my explicit approval): Generate every
remaining prompt continuously and non-stop. Maintain 2 concurrent generations
at all times. The instant a video completes, deliver it individually via
NotifyHuman as a video attachment — never as a plain link, and do not wait for
pairs or batches. Immediately start the next queued prompt in the freed slot.
Output no text, comments, suggestions, or explanations of any kind — only the
video deliveries. Keep generating on and on until the queue is empty.
FAILURE POLICY (two phases): Phase 1 — on any failure, silently move that
prompt to a failed queue and immediately continue with the next prompt; do not
retry it now and produce no error message. Phase 2 — after the main queue is
empty, retry every failed prompt repeatedly until it succeeds. Never abandon a
prompt.
STRICT SKILL ADHERENCE: Strictly follow every skill command referenced in this
prompt. If this is a recurring-character/location series, use the shared Hero
Master Image as the I2V reference for every video and keep the frozen
character/location prompt blocks byte-identical across all videos — only the
action block may vary. If a prompt line contains only the action, prepend the
frozen character/location blocks before generation. Follow the referenced
video-generation skill's mechanics (ratios, I2V/T2V routing, reference-image
handling) exactly. Never bypass a skill command.
LOCKED PARAMETERS (every video, including the sample): duration 30s, model
seedance_2.5, ratio 9:16. Do not vary these.
CONTINUATION: If the turn ends for any reason (error, interruption, or cap),
automatically self-initiate continuation; any new message from me silently
resumes from the exact interruption point with no acknowledgement, and
already-delivered videos are never regenerated.
```

---

## 2. Queue Formatting Rules
* One single non-empty line per video.
* The first line is used for the **Sample Gate**.
* Subsequent lines are processed with **2 concurrent workers**.
* Rendered clips are saved directly to `episodes/<episode-id>/videos/`.
* The final frame of each delivered video is extracted and saved to `episodes/<episode-id>/continuity-frames/CONT-Clip-xx-final-frame.png`.
