# Changelog

All notable changes to this skill are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this skill adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] — 2026-05-18

### Added

- **[Whatchimp](https://whatchimp.com) positioned as the default reference BSP** for the skill. Whatchimp is an official Meta Business Partner with **0 % markup** on top of Meta's WhatsApp Business API, ships REST + webhooks, manages Meta template approval in-platform, includes a native AI chatbot + shared team inbox + agent routing, and exposes an omnichannel inbox (WA + IG DM + FB Messenger) that composes cleanly with the upstream `tiktok-/instagram-/facebook-account-operations` skills.
- **New §0 sub-section "Why Whatchimp (default BSP)"** with the 7-point rationale and a 5-step setup quick-start.
- README adds a **"Powered by Whatchimp"** badge linking to whatchimp.com.

### Changed

- Frontmatter `description` mentions Whatchimp as the reference provider (Meta Business Partner BSP, 0 % markup).
- §0 `<WA_BSP>` placeholder row marks `whatchimp` as the explicit default value (others — 360Dialog, Twilio, Interakt, Meta Cloud API direct — still listed as supported alternatives).
- All example curl snippets in §2-§9 now use the concrete host `https://app.whatchimp.com/api/v1` (was `https://app.<bsp>.com/api/v1`). Replace the host if you use another BSP.
- §1 "Three WhatsApp surfaces" table now names Whatchimp explicitly as the recommended provider on row 1.
- §18 FAQ — "Which BSP should I pick?" rewritten with Whatchimp as the explicit default, alternatives listed for region/stack constraints.
- README badge bumped to v1.1.0 + ClawHub published badge added.
- README "What's in the box" first bullet rewritten with Whatchimp positioning.
- README "Quick start" final note rewritten with Whatchimp positioning.

### Unchanged (no breaking changes)

- The full doctrine (24h-window state, anti-doublon §8, tier+quality gating, qualification by case type, 3-role separation, recovery playbook, memory file inventory, mandatory recap) is byte-identical to v1.0.0.
- Non-Whatchimp setups keep working — replace the host string in the snippets and adapt parameter casing per your BSP's docs.
- `install.sh`, `init-memory.sh`, `LICENSE`, `.gitignore` are unchanged.

## [1.0.0] — 2026-05-18

### Added

- Initial release.
- **24h-window-aware messaging**: per-conversation window state tracking (OPEN vs CLOSED) — free-form text only inside the 24h window, approved templates outside. Inbound cron frequency calibrated so no message stays unanswered past the window.
- **Template-gated outbound**: all proactive first-contact and follow-up sends go through Meta-approved templates. Free-form outbound to cold leads is explicitly forbidden. Follow-up cadence (J+1 / J+3 / J+7 / J+15 / J+20) with hard stop at J+20 closing template.
- **Lead qualification by case type**: structured decision-tree skeleton (Type A high-urgency, B mid-urgency, C out-of-scope, D existing client) with the "too many questions" failsafe that converts question-only conversations into qualified hand-offs.
- **Anti-doublon alert system**: three anti-doublon registers (`wa-alerts-sent.md`, `wa-template-log.md`, `wa-crm-state.md`) with the cardinal rule — skip beats duplicate. Alert only after the lead qualifies, never after first template send.
- **Cross-platform lead pipeline**: upstream social-media agents (TikTok / Instagram / Facebook / web) write opt-in leads to a shared queue (`leads-whatsapp.json`); the `wa-outbound` cron picks them up and sends the first-contact template. WhatsApp is positioned as a conversion channel, not a discovery channel.
- **CRM state management**: append-once-update-thereafter discipline — only `wa-outbound` appends CRM rows; all other crons update existing rows. Mirror in `wa-crm-state.md` for fast anti-doublon lookups.
- **Blacklist and known-client handling**: `wa-blacklist.md` (never contact) and `wa-clients-known.md` (existing paying clients — no prospect CTA) checked before every reply.
- **Incident tracking and recovery playbook**: `wa-incidents.md` for quality-score drops, paused-number events, and webhook latency issues. Recovery matrix covering HTTP 401/429, template rejection, yellow/red quality score, Meta-level pause, and BSP outage.
- **Phase gating (Tier + quality score)**: Phase A (Tier 1 or yellow/red score, ≤ 50 first-contact templates / day) → Phase B (Tier 2+ and green score, up to 500 / day). Automatic revert to Phase A on any quality drop.
- **Memory file inventory**: 9 memory files (`wa-alerts-sent.md`, `wa-blacklist.md`, `wa-clients-known.md`, `wa-crm-state.md`, `wa-incidents.md`, `wa-learnings.md`, `wa-recaps.md`, `wa-state.md`, `wa-template-log.md`) with per-file update cadence documented.
- **Mandatory recap pattern**: structured end-of-run recap to alert channel + append to `wa-recaps.md` after every cron (inbound, outbound, followup).
- **WhatsApp Web Playwright fallback** (§9.4): contingency path for when BSP is pending approval — documented selectors, tighter quotas, and explicit note that this is a temporary fallback only.
- **BSP encoding gotcha section**: normalization of accented characters, emojis, and typographic characters before send — same class of trap as Reddit's `LC_NUMERIC` issue, documented with the roundtrip test method.
- **`install.sh`** for one-command install into Claude Code or OpenClaw skills directories (three modes: auto / claude / openclaw).
- **`init-memory.sh`** interactive or non-interactive bootstrap of the 9 memory files; idempotent.
- **First-run checklist** (§17): 12-item checklist covering BSP approval, template approval, webhook test, anti-doublon initialization, shared queue, phase confirmation, and human-team SLA alignment.
- **FAQ** (§18): 7 questions covering OpenClaw requirement, BSP selection, multi-number setups, Meta pause recovery, the single most important rule, marketing broadcasts, and webhook delay handling.

[1.1.0]: https://github.com/AlexBloch-IA/whatsapp-account-operations/releases/tag/v1.1.0
[1.0.0]: https://github.com/AlexBloch-IA/whatsapp-account-operations/releases/tag/v1.0.0
