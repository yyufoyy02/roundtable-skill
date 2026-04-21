# Roundtable

> [中文](README.md) | English

Gather historical and contemporary figures to debate your questions in intense multi-round discussions. Not giving you one answer — letting multiple real thinking styles collide on your problem.

Imagine: Musk deconstructing your problem with first principles, Confucius examining your solution through empathy, Socrates backing you into a corner with three probing questions — all clashing on the same issue, while you can pass notes, slam the table, or cast votes at any moment.

That's Roundtable.

## Quick Start

```bash
npx skills add liangweijian/roundtable-skill -g
```

After installation, start a debate in Claude Code by typing your topic (Chinese and English both supported):

```
roundtable vote should AI replace programmers
roundtable quick what is justice
roundtable @Musk @Confucius @Socrates what is justice
```

## What It Does

**Multi-perspective decision-making** — Single frameworks create blind spots. Let Musk, Confucius, and Socrates examine your problem simultaneously to uncover angles you'd never find alone.

**Recreate classic debates** — Pit Cao Cao against Zhuge Liang on strategy, or Confucius against Socrates on education — not textbook abstractions, but clashes of real personalities with convictions and blind spots.

**Understand different thinking systems** — Everyone runs their own "operating system." Through debate, experience how first principles, empathy-based reasoning, and the Socratic method produce radically different conclusions on the same question.

**Solution review** — Adversarial discussion between opposing sides quickly exposes blind spots and risks — far more efficient than thinking alone.

```
roundtable @曹操 @诸葛亮 should Liu Bei have taken Yi Province after the Longzhong Plan
roundtable @孔子 @苏格拉底 what makes a good education
roundtable vote should companies return to the office or stay remote
```

## Two Debate Formats

### Structured Debate (Default)

Maximum information density. The system auto-selects members, divides factions (Proposition + Opposition + Observer), and drives three progressive rounds: Opening → Clash → Turning Point → Verdict. Supports signature skills and random events.

#### Example: Can AI Replace Programmers?

> **🔴 Evolution "Code is a tool, tools evolve"** — Musk
> **🔵 Humanism "The creator's soul cannot be replaced by machines"** — Luo Yonghao, Confucius
> **⚪ Observer** — Socrates

**Musk** redefines the problem from first principles —

> Programming isn't a profession. Programming is a tool — just like calculation isn't a profession, the abacus is. AI doesn't replace "programmers" — AI replaces the act of "writing code."

**Luo Yonghao** counters from a product perspective —

> Why could Jobs not write code, yet Apple's products crushed every technically superior company? Because product judgment, aesthetic intuition, understanding of human nature — these things aren't solved by logical reasoning.

**Socrates** probes the definition —

> When a programmer sits down at their computer, how much of what they do is "writing code," and how much is "thinking about what to write"? If "thinking" takes most of the time — then is AI replacing programmers, or just the least important part of their job?

**Round 3**, Socrates unleashes his signature skill "Maieutics" —

> **Q:** Your most successful product decisions at Tesla — were they based on data analysis or intuition?
> **Q:** If intuition — was it shaped by failures, pain, convictions you've experienced? Can AI replicate these life experiences?
> **Q:** If your success comes precisely from things AI cannot replicate — why are you so certain AI can "redefine creation"?

*The room falls silent. Musk revises his position —*

> AI won't replace all programmers, but it will shrink the profession's population by 90%.

**Verdict:** AI won't "replace" programmers, but like tractors replacing farmers, it will transform programming from a craft into agriculture — far fewer practitioners, but "agronomists" are more valuable than ever.

> Socrates (walking to the door, softly): "The only thing I know is that I know nothing."
> Musk (turning around): "...That's actually a good product feature name. 'I Know Nothing.' I'm writing that down."

Full debate transcript: [`demo/当机器学会造物_20260419.md`](demo/当机器学会造物_20260419.md)

---

### Vote Debate

Qi Pa Shuo (Chinese debate show) style, with a 100-vote live audience. No observers — everyone is split into Proposition vs Opposition. The final act reveals the winning side and MVP. Real-time vote shifts are the main attraction.

#### Example: Should You Check Your Partner's Phone?

> **🔴 Proposition: Knowledge is Power "Know everything to win"** — Trump, Cao Cao
> **🔵 Opposition: Trust is Unopenable "Surveillance is betrayal"** — Confucius, Socrates

📊 Initial votes: Proposition 40 vs Opposition 60

**Trump** starts from leverage thinking —

> In business, in politics, in marriage — information is everything. Your marriage is the biggest deal of your life — and you don't even do due diligence?

**Socrates** cuts to the bone —

> The act of checking the phone itself proves trust is already dead. You don't inspect something you truly trust.

**Trump** unleashes "Fake News" —

> This debate has been rigged from the start! This isn't about trust vs distrust. This is about **smart vs stupid**.

(Proposition ↑ +8 🔥 Skill boost, closing the gap to 49 vs 51)

**Confucius** closes with "A person without trust" —

> I am not ignorant of betrayal in this world. Yet I still choose to trust. Not out of naivety — because I know: the cost of distrust far exceeds the cost of betrayal. Betrayal hurts for a moment; distrust destroys a lifetime.

**Final Act:** Opposition 56 vs Proposition 44. Opposition wins. ⭐ MVP: Socrates (net vote swing +7)

Full debate transcript: [`demo/信任与窥探的边界_20260420.md`](demo/信任与窥探的边界_20260420.md)

---

## Usage Guide

### Three Depth Levels

| Mode | Command | Best For |
|------|---------|----------|
| Full | `roundtable <topic>` | Serious analysis, solution review |
| Summary | `roundtable summary <topic>` | Quick overview of all positions |
| Quick | `roundtable quick <topic>` | Brainstorming, quick reference |

Add `vote` to switch to vote format: `roundtable quick vote AI ethics`

### In-Debate Interactions (Full Mode)

| Command | Effect |
|---------|--------|
| `note Musk: what do you think?` | Pass a secret note; that member responds next round |
| `slam Confucius! what about Fan Chi learning farming?` | Slam the table; force an impromptu answer |
| `vote Zhuge Liang` | Express support; the host references it next round |
| `pause` / `resume` | Toggle manual/auto-play mode |

### Post-Debate Follow-up

| Command | Effect |
|---------|--------|
| `ask Munger: what do you think?` | Follow up with a specific member for depth |
| `ask more <member name>` | Alternative syntax, same effect |
| Mention a member's name in a question | Contextual follow-up |

### Specifying Members

Use `@name` to specify debate participants:

```
roundtable @Musk @Confucius @Socrates <topic>
```

If fewer than 3 members are specified, the system auto-fills. Works with depth and format options.

### Member Management

| Command | Description |
|---------|-------------|
| `roundtable add Munger Jobs` | Distill new members into the roundtable |
| `roundtable remove <name>` | Remove a member |
| `roundtable members` | View all members |
| `roundtable members <name>` | View a specific member's details |

## Member Library

7 built-in members, ready to use out of the box:

| Member | Domain | Signature Skill |
|--------|--------|----------------|
| Musk | Tech entrepreneurship & engineering breakthroughs | First Principles |
| Confucius | Ethics, philosophy & humanistic education | Words of Wisdom |
| Socrates | Ethics & critical thinking | Maieutics |
| Zhuge Liang | Strategic planning & governance | Empty Fort Strategy |
| Trump | Power dynamics & attention engineering | Fake News |
| Cao Cao | Politics, military & power strategy | Hostage Emperor |
| Shakespeare | Human insight & narrative thinking | Soliloquy |

Supports custom members (`圆桌会议 加入 <name>`) via the [huashu-nuwa](https://github.com/alchaincyf/nuwa-skill) distillation mechanism.

## Gamification System

Fully automatic — no user action required.

- **Signature Skills** — Each member has a unique skill (e.g., Socrates' "Maieutics" — three progressive probing questions), usable once per debate, auto-triggered in rounds 2–3
- **Random Events** — ~30% chance of sudden events (digging up old scores, emotional outbursts, etc.) that disrupt the debate balance
- **Hidden Easter Eggs** — Specific character combinations trigger fun interactions (e.g., Musk + Zhuge Liang cross-domain collision)

## Project Structure

```
skills/roundtable/
├── SKILL.md                    # Main controller
├── prompts/                    # Functional modules (loaded on demand)
│   ├── domain-mapper.md        # Member matching & faction division
│   ├── debate-protocol.md      # Debate protocol
│   ├── skill-system.md         # Gamification system
│   ├── quality-rules.md        # Quality rules
│   ├── member-management.md    # Member management
│   ├── self-test.md            # Self-test
│   └── formats/                # Output format templates
│       ├── shared.md
│       ├── structured.md
│       └── vote.md
├── members/                    # Member profiles
│   ├── {built-in members}/SKILL.md
│   └── custom/{custom members}/SKILL.md
├── demo/                       # Example debate transcripts
└── report/                     # Debate archives
```

## License

MIT
