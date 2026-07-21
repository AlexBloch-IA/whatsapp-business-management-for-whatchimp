# Whatsapp Business Ops

> Run WhatsApp Business outbound without losing quality score — 24h window, approved templates, duplicate guard. Use when answering inbound leads or sending follow-ups from a cron.

[![License: MIT-0](https://img.shields.io/badge/License-MIT--0-blue.svg)](https://opensource.org/licenses/MIT-0)
[![ClawHub](https://img.shields.io/badge/ClawHub-Published-orange)](https://clawhub.ai/alexbloch-ia/skills/whatsapp-business-ops)
[![Version](https://img.shields.io/badge/version-2.0.1-green)](https://clawhub.ai/alexbloch-ia/skills/whatsapp-business-ops)

A Claude Code / [OpenClaw](https://openclaw.ai) skill, published on [ClawHub](https://clawhub.ai/alexbloch-ia/skills/whatsapp-business-ops). Portable operating doctrine — drop it into an agent's skills directory and follow it.

---

## What the doctrine covers

- Configure
- The 24h window
- Phase gating and quotas
- Duplicate guard
- Data minimization and retention
- Identity
- Reply rules (free-form, inside open window)
- Flow
- Exit codes
- Memory files
- First-run checklist

The full, load-bearing detail lives in [`SKILL.md`](./SKILL.md).

---

## Install

### Via ClawHub (recommended)

👉 **<https://clawhub.ai/alexbloch-ia/skills/whatsapp-business-ops>**

```bash
clawhub install whatsapp-business-ops
# or, from an OpenClaw agent:
openclaw skills install @alexbloch-ia/whatsapp-business-ops
```

### Via this repository (manual)

```bash
git clone https://github.com/AlexBloch-IA/whatsapp-business-ops.git
cd whatsapp-business-ops
./install.sh
```

The script copies the full skill payload into every supported stack it finds:

- `~/.claude/skills/whatsapp-business-ops/` (Claude Code)
- `~/.openclaw/skills/whatsapp-business-ops/` (OpenClaw)

### Manual copy

```bash
mkdir -p ~/.claude/skills/whatsapp-business-ops
cp -R SKILL.md ~/.claude/skills/whatsapp-business-ops/   # plus scripts/, references/, templates/… if present
```

---

## Repository structure

```
whatsapp-business-ops/
├── SKILL.md
├── README.md
├── LICENSE
└── install.sh
```

---

## License

Released under **MIT-0** (MIT No Attribution). Use, fork, adapt, redistribute — no attribution required.

---

## Author

[Alexandre Bloch](https://github.com/AlexBloch-IA) — founder of [OpenClaw](https://openclaw.ai).
Published on [ClawHub](https://clawhub.ai/alexbloch-ia).
