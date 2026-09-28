# Seedance 2.5 — 30-Second Drama Series Prompt System

A reusable guide for building consistent **30-second Seedance prompts** for ongoing cinematic teleserye / drama scenes.

---

## Purpose

Use this system to keep your scenes consistent across episodes and clips.

This framework is designed to improve:

- character identity consistency
- wardrobe consistency
- camera continuity
- environment continuity
- prop continuity
- emotional clarity
- scene-to-scene transitions
- better use of multiple reference images

---

## Core Principle

Each clip should clearly tell Seedance:

1. **Who** the characters are
2. **Where** the scene is happening
3. **How** the scene begins
4. **What** happens over the 30 seconds
5. **How** the scene ends for the next clip

For ongoing series, the prompt should behave like a **chain**:

**Previous clip final frame -> current clip frame 1 -> current action -> current final frame -> next clip**

---

## Recommended 30-Second Beat Structure

Use this pacing for most drama scenes:

- **0.0–3.0s** -> Instant hook
- **3.0–8.0s** -> Main action / confrontation begins
- **8.0–13.0s** -> Emotional reaction
- **13.0–18.0s** -> Escalation
- **18.0–23.0s** -> Major dramatic turn / reveal
- **23.0–27.0s** -> Aftershock / emotional fallout
- **27.0–30.0s** -> Cliffhanger ending / bridge to next scene

This is the best default structure for 30-second teleserye clips.

---

## Reference Image Strategy

Do **not** attach random images without assigning their purpose.

Every reference image should have a clear job.

### Priority Order

Use this priority when deciding what references to attach:

1. **Character identity**
2. **Previous clip final frame**
3. **Second main character identity**
4. **Environment / location reference**
5. **Important prop reference**
6. Everything else

---

## What References To Attach

### 1) Character Identity Reference (Highest Priority)

Attach a clean identity image for each important character in the scene.

Best type of reference:

- clean portrait
- medium shot
- 3/4 body shot
- face clearly visible
- hairstyle clearly visible
- clothing clearly visible
- accessories clearly visible

A good identity reference should clearly establish:

- face
- age
- skin tone
- hairstyle
- body proportions
- clothing
- accessories
- overall appearance

Avoid using chaotic action screenshots as the main character reference when a clean character sheet already exists.

**Example**

- `@1 = Bea Ilustre -> bea-identity.png`
- `@2 = Don Fernando -> don-fernando-identity.png`

---

### 2) Previous Clip Final Frame (Extremely Important for Ongoing Series)

If the new scene continues directly from a previous generated clip, attach the **last frame of the previous clip**.

This controls:

- character position
- body orientation
- emotional state
- camera angle
- pose
- room continuity
- object placement
- lighting continuity

Think of it this way:

- **Character identity reference = WHO they are**
- **Previous final frame = WHERE and HOW they currently are**

For ongoing series, this is often more useful than a generic background image.

**Example**

- `@SCENE = previous clip final frame -> clip-06-final-frame.png`

---

### 3) Environment / Location Reference

Use a clean location reference when:

- this is the **first clip in a new location**
- the location is visually important
- the model keeps redesigning the room
- there is no usable previous final-frame reference

This controls:

- architecture
- room layout
- furniture placement
- lighting style
- color palette
- background details

**Examples**

- `hospital-lobby-reference.png`
- `ilustre-dining-room-reference.png`
- `st-claire-corridor-reference.png`

Once a scene location has already been established and you have a good previous final frame, you usually do **not** need to keep attaching the clean background reference every time.

---

### 4) Important Prop Reference

Only use this when the prop is story-critical.

Good examples:

- money briefcase
- medicine bottle
- ledger
- envelope
- phone screen
- necklace
- legal document
- family portrait

This is helpful when the prop is central to the scene and must remain visually consistent.

**Example**

- `@4 = Money Briefcase -> briefcase-1million-reference.png`

Then state clearly in the prompt:

> The briefcase in `briefcase-1million-reference.png` is the exact same briefcase held by @1 throughout the scene.

Do not waste reference slots on unimportant generic objects.

---

## Best Default Reference Combinations

### A) Two-Character Ongoing Scene (Best Default)

Use:

1. Character A identity
2. Character B identity
3. Previous clip final frame

**Example**

- `@1 = Bea -> bea-identity.png`
- `@2 = Don Fernando -> don-fernando-identity.png`
- `@SCENE = Previous final frame -> clip-06-final-frame.png`

This gives Seedance:

- who @1 is
- who @2 is
- what the scene currently looks like

This is the best default setup for most of your drama clips.

---

### B) First Clip in a New Location

Use:

1. Character A identity
2. Character B identity
3. Environment reference

**Example**

- `@1 = Leo -> leo-identity.png`
- `@2 = Bea -> bea-identity.png`
- `@ENVIRONMENT = Ilustre Mansion Driveway -> ilustre-mansion-driveway.png`

After generating that first clip, save the **final frame** and use it as the continuity reference for the next clip.

---

### C) One-Character Scene

Use:

1. Character identity
2. Previous clip final frame or environment reference
3. Important prop or environment detail if needed

**Example**

- `@1 = Maya -> maya-identity.png`
- `@SCENE = Previous clip final frame -> clip-09-final-frame.png`
- `@ENVIRONMENT DETAIL = Mansion gallery -> mansion-gallery-reference.png`

---

### D) Three-Character Scene

If three characters are all important, prioritize identity references.

Use:

1. Character A identity
2. Character B identity
3. Character C identity

Then describe the environment in text.

If there is room for one more reference, use the previous clip final frame.

If forced to choose between a clean background reference and a major character identity reference, choose the **character identity**.

Face continuity matters more.

---

## Permanent Reference System for Ongoing Series

Build a reusable library of references.

### Character Reference Library

Examples:

- `CHAR-001-Bea-Ilustre.png`
- `CHAR-002-Leo-Castillo.png`
- `CHAR-003-Don-Fernando.png`
- `CHAR-004-Dona-Vivian.png`
- `CHAR-005-Maya.png`
- `CHAR-006-Hector.png`

### Location Reference Library

Examples:

- `LOC-001-Ilustre-Mansion-Exterior.png`
- `LOC-002-Ilustre-Dining-Hall.png`
- `LOC-003-Ilustre-Grand-Foyer.png`
- `LOC-004-Hospital-Lobby.png`
- `LOC-005-St-Claire-Corridor.png`
- `LOC-006-St-Claire-Courtyard.png`
- `LOC-007-Executive-Office.png`

### Prop Reference Library

Examples:

- `PROP-001-Money-Briefcase.png`
- `PROP-002-Heart-Medicine-Bottle.png`
- `PROP-003-Torn-Ledger.png`
- `PROP-004-Envelope.png`

### Continuity Frame Library

Examples:

- `CONT-Clip-01-final-frame.png`
- `CONT-Clip-02-final-frame.png`
- `CONT-Clip-03-final-frame.png`

This system keeps your automation pipeline clean and reusable.

---

## Seedance Prompt Template — 30 Seconds

```text
DURATION: 30 SECONDS
ASPECT RATIO: 9:16 VERTICAL
STYLE: CINEMATIC LIVE ACTION — HIGH-END FILIPINO DRAMA / TELESERYE
QUALITY: ULTRA HD, PHOTOREALISTIC, HIGH DETAIL, REALISTIC TEXTURES
FPS: 24fps
GENRE: DRAMA / EMOTIONAL CONFLICT / [SCENE-SPECIFIC GENRE]
MOTION: NATURAL, FLUID, PHYSICALLY COHERENT, CONTINUOUS
LIGHTING: [EXACT SCENE LIGHTING]
COLOR: CINEMATIC CONTRAST, NATURAL FILIPINO SKIN TONES, REALISTIC COLOR GRADING

CAMERA:
Professional cinematic drama cinematography.
Use:
- medium shots
- close-ups
- over-the-shoulder shots
- 3/4 angles
- subtle tracking shots
- gentle push-ins during emotional beats
- controlled handheld movement only when tension rises
- shallow depth of field for emotional emphasis

Camera movement must support the story and emotional progression.
Do not randomly switch angles.
Do not break screen direction.
Maintain clear spatial geography.

CHARACTER REFERENCES:

@1 = [CHARACTER NAME]
REFERENCE IMAGE: [FILENAME]
Must preserve exact:
- face
- age
- skin tone
- hairstyle
- body proportions
- clothing
- accessories
- overall appearance

@2 = [CHARACTER NAME]
REFERENCE IMAGE: [FILENAME]
Must preserve exact:
- face
- age
- skin tone
- hairstyle
- body proportions
- clothing
- accessories
- overall appearance

@3 = [OPTIONAL THIRD CHARACTER / IMPORTANT PROP / ENVIRONMENT]
REFERENCE IMAGE: [FILENAME]

REFERENCE ASSIGNMENT RULE:
[REFERENCE IMAGE 1] controls @1 only.
[REFERENCE IMAGE 2] controls @2 only.
[REFERENCE IMAGE 3] controls @3 only.

All relevant references must be used.
Do not rely only on the first image.
Do not merge identities.
Do not blend facial features between references.

IMPORTANT CONTINUITY RULES:
All characters remain visually consistent throughout the entire 30-second sequence.

NO:
- face morphing
- hairstyle changes
- wardrobe changes
- age changes
- identity swapping
- random teleportation
- extra characters
- duplicated characters
- extra limbs
- disappearing props
- random props appearing
- unexplained movements

Every movement must have a clear beginning, continuation, and end.
Every reaction must logically follow the action before it.

PREVIOUS-SCENE CONTINUITY:
This clip starts immediately after the previous scene.

At frame 1:
@1 is [EXACT STARTING POSITION / POSE / EXPRESSION]
@2 is [EXACT STARTING POSITION / POSE / EXPRESSION]
@3 / props are [EXACT POSITION]

Maintain continuity from the previous clip.
Do not reposition characters without visible movement.

SCENE / ENVIRONMENT:
[DETAILED LOCATION DESCRIPTION]

Example:
Interior of a luxury mansion dining hall at night.
A long dark mahogany dining table sits at center.
Warm chandelier lighting remains consistent throughout.
Marble floors, carved wood walls, and background décor remain unchanged.
The location remains continuous for the full 30 seconds.

EMOTIONAL STATE:
@1 begins feeling: [EMOTION]
@2 begins feeling: [EMOTION]

Emotional progression of @1:
[EMOTION] -> [EMOTION] -> [EMOTION]

Emotional progression of @2:
[EMOTION] -> [EMOTION] -> [EMOTION]

Facial expressions must visibly communicate emotional progression.
Avoid exaggerated overacting unless specifically requested.

ACTION TIMELINE:

0.0–3.0s — INSTANT HOOK
Start directly in the drama.
No slow introduction.
No empty atmospheric establishing shot.

@1 [IMMEDIATE ACTION]
@2 [IMMEDIATE RESPONSE]

CAMERA:
[TIGHT SHOT DESCRIPTION]
Example: Tight 3/4 medium close-up on @1 with @2 visible in the foreground.

3.0–8.0s — MAIN CONFRONTATION / PRIMARY ACTION
The main dramatic action begins.

@1 [ACTION / DIALOGUE]
@2 [REACTION / COUNTERACTION]

If there is dialogue, write the exact line:
@1 says: "[DIALOGUE]"

CAMERA:
[SHOT DESCRIPTION]
Example: Over-the-shoulder shot from behind @2 toward @1.

8.0–13.0s — EMOTIONAL REACTION
Let the emotional impact register clearly.

@2 processes what happened through realistic facial acting and body language.
Describe visible reaction:
- eyes widen / narrow
- jaw tightens
- breathing changes
- grip weakens
- shoulders tense
- lips tremble

CAMERA:
Close-up on @2.
Hold long enough for the reaction to be readable.

13.0–18.0s — ESCALATION
The scene intensifies naturally.

@1 [ESCALATING ACTION]
@2 [ESCALATING RESPONSE]

If a prop is involved, it must remain visible and physically consistent.
If one character moves, show the full movement.

CAMERA:
Gradually widen into a two-shot or subtle tracking shot.
Maintain left/right screen geography.

18.0–23.0s — DRAMATIC TURN / REVEAL
A new reveal, realization, or major shift happens.

Examples:
- hidden truth exposed
- object revealed
- sudden entrance
- emotional confession
- rejection
- power reversal

@1 [REVEAL / TURN]
@2 [REACTION]

CAMERA:
Use a stronger emotional framing:
- push-in
- reaction close-up
- over-the-shoulder reveal
- slow turn to the new focus

23.0–27.0s — AFTERSHOCK / EMOTIONAL FALLOUT
Show the immediate effect of the dramatic turn.

@1 [AFTERSHOCK ACTION]
@2 [AFTERSHOCK REACTION]

Allow space for:
- silence
- staring
- crying
- backing away
- gripping an object
- dropping something
- slow realization

CAMERA:
Controlled dramatic close-up or medium shot.
Do not rush this beat.

27.0–30.0s — CLIFFHANGER / NEXT-SCENE BRIDGE
End on one powerful unresolved beat.

Examples:
- someone turns away
- someone begins to cry
- a hand reaches out
- an object drops
- a door opens
- a stare locks in
- a threatening step forward
- a shocking entrance
- a character collapses
- someone begins to speak but is cut off

@1 [FINAL ACTION]
@2 [FINAL REACTION]

FINAL CAMERA:
[FINAL SHOT DESCRIPTION]
Example: Slow push into @1’s stunned face, ending on a frozen emotional cliffhanger.

FINAL FRAME CONTINUITY:
At the exact final frame:
@1 = [POSITION / POSE / EXPRESSION]
@2 = [POSITION / POSE / EXPRESSION]
@3 / PROP = [POSITION]
CAMERA = [POSITION]
LIGHTING = [STATE]

This final frame must be suitable as the visual starting point for the next clip.

AUDIO:
Use realistic environmental ambience appropriate to the scene:
- rain
- thunder
- hospital ambience
- room tone
- footsteps
- fabric movement
- breathing
- distant traffic
- doors
- tableware
- quiet background tension

Dialogue must be clear and natural.
Do not add random crowd voices.
Do not add unnecessary music unless requested.

PHYSICAL ACTION RULES:
Every interaction must clearly show:
CAUSE -> CONTACT -> REACTION -> RECOVERY

If a character grabs another:
- show the hand reaching
- show contact
- show the receiving reaction
- show whether the grip tightens or releases

If an object falls:
- show it leaving the hand
- show the fall
- show the landing

If a character walks or turns:
- show continuous natural body movement
- no unnatural sliding

CAMERA & MOTION RULES:
Professional cinematic teleserye camera choreography.
Camera follows the story.
No random angle switching.
No excessive cuts.
No awkward fast motion.
No unnecessary slow motion.
No frozen poses.
No empty dead time.
No lifeless staring unless intentionally dramatic.

VISUAL CONSISTENCY:
Maintain:
- exact faces
- exact wardrobe
- exact hairstyles
- exact accessories
- exact room layout
- consistent lighting
- consistent weather
- consistent time of day
- consistent props
- consistent character scale and height
- consistent screen direction

NO:
- subtitles
- captions
- text
- watermarks
- logos

OVERALL FEEL:
A polished, expensive, emotionally gripping Filipino drama scene that feels like a continuous segment from a professionally filmed teleserye.
It must feel story-driven, emotionally clear, visually consistent, and suitable for vertical short-form viewing.

Priority:
1. Character identity
2. Story clarity
3. Emotional acting
4. Physical continuity
5. Camera coherence
6. Environmental consistency
7. Strong cliffhanger ending
```

---

## Quick Practical Rules

### Rule 1
For most two-character ongoing scenes, attach:

- Character A identity
- Character B identity
- Previous clip final frame

### Rule 2
For the first clip in a new location, attach:

- Character A identity
- Character B identity
- Environment reference

### Rule 3
For scenes with an important prop, attach the prop only if it is central to the story.

### Rule 4
Do not attach too many random references.
More references are not always better.
Only attach references with a clear role.

### Rule 5
Always describe the role of each reference image inside the prompt.

Bad:
- attach 3 images and hope the model understands them

Good:
- `bea-identity.png` controls @1
- `don-fernando-identity.png` controls @2
- `clip-06-final-frame.png` controls starting pose, camera, and room continuity

### Rule 6
Always make the final frame intentional so it can become the next clip’s continuity reference.

---

## Best Summary

For **90% of your ongoing teleserye scenes**, the best 3-reference setup is:

1. **Character A identity**
2. **Character B identity**
3. **Previous clip final frame**

That setup is usually stronger than:

- Character A
- Character B
- Generic background

because the previous final frame already helps preserve:

- scene continuity
- camera continuity
- lighting continuity
- pose continuity
- object continuity

---

## Final Goal

Your Seedance workflow should behave like a real production pipeline:

- clean character identity references
- stable location references
- story-critical prop references
- final-frame continuity from clip to clip
- a consistent 30-second dramatic structure

If you apply this system consistently, your generated scenes will be much easier to chain together into a believable ongoing series.
