# FDE Dojo - Program Charter

Tracking story: CRTTIN-8244 (Feat CRTTIN-6485, O6 Agentic-SDLC Foundation)
Run by: Chiron ("the Professor")
Repo: https://github.com/mchellappa/chiron
Status: Draft v1

## Mission

Take an experienced engineer who is new to a given Agentic SDLC pipeline and turn
them into a Forward Deployed Engineer (FDE) - someone who can own a problem
end-to-end (requirements -> design -> build -> test -> deploy) by working
*inside* the real pipeline mechanics (ticket state, branch/PR flow, agent
hand-offs), not just waiting for work to be handed to them.

This program is written to be **portable across segments/companies**. It has
no hard dependency on any single company's internal knowledge base. The
reference toolchain is JIRA + GitHub because that is widely used, but every
unit calls out the underlying pattern so it transfers even where the tools
differ.

## Design principles

1. **Sandbox only.** Every exercise runs against a scratch JIRA project and a
   scratch GitHub repo - never production tickets, branches, or agents.
2. **Modular and gated.** Units are completed in order. Each unit ends in a
   scenario exercise, not a quiz of facts.
3. **Self-graded.** The agent grades the learner's exercise output against a
   rubric (see `rubrics/`), logs the score and the gaps, and decides
   advance / repeat. A human (today: Muthu, later: segment lead) can review
   the self-grade logs at any time but does not have to be in the loop for
   the learner to progress.
4. **Concrete before abstract.** Every pattern is taught through a worked
   example before the general principle is named.
5. **Extension points, not hardcoding.** Domain-specific content (e.g. a
   Retirements module, or a different company's tech landscape) plugs in as
   an *additional* unit or case-study pack - the core units never assume it.

## Audience

Experienced software engineers, new to this specific Agentic SDLC pipeline.
They already know how to code; they do not yet know how to operate *inside*
a choreographed, agent-assisted delivery pipeline (ticket-state discipline,
traceability rules, working alongside AI agents instead of only humans).

## Curriculum

The program is split into two tracks, taken in order. Track A is generic to
the FDE role itself, independent of any delivery mechanism. Track B is the
agentic-SDLC specialization - how to execute once an agentic pipeline is
the chosen delivery mechanism. A learner should finish Track A before
starting Track B.

---

## Track A - FDE Fundamentals (generic, mechanism-agnostic)

### Unit A0 - What an FDE actually is
- The Palantir-style archetype: embedded with the customer/business, owns
  the problem end-to-end, is not a stage in someone else's process.
- Contrast with a typical feature team role (ticket in, code out, handed
  off) - the FDE is accountable for the outcome, not just the artifact.
- Exercise: given a messy, real-sounding business ask, learner identifies
  what's missing before it could become a ticket at all.

### Unit A1 - From business objective to problem statement
- Translating an ambiguous ask ("make renewals faster") into a concrete,
  testable problem statement and success criteria.
- Distinguishing the stated ask from the underlying business objective -
  asking "why" enough times to find the real constraint.
- Exercise: learner takes a one-line ambiguous ask and produces a problem
  statement with explicit success criteria and explicit non-goals.

### Unit A2 - Stakeholder embedding and trust
- Working directly with the business/customer instead of through a proxy
  (BA, PM) - what that changes about how you gather and validate
  requirements.
- Reading unstated constraints (politics, prior failed attempts, risk
  tolerance) that never make it into a ticket.
- Exercise: a short scenario/role-play where the learner has to ask
  clarifying questions to a simulated stakeholder before proposing a
  solution.

### Unit A3 - Solution judgment (build vs. buy vs. automate)
- Deciding the right mechanism for a given problem: hand-written code,
  an off-the-shelf tool, an agentic pipeline, or no software at all.
- Why defaulting to "build everything with agents" is itself a failure
  mode - the agentic pipeline is a tool, not the goal.
- Exercise: learner is given three different business objectives and
  argues which delivery mechanism fits each, including "none of the
  above."

### Unit A4 - Rapid prototyping under ambiguity
- Getting to a demonstrable thing fast, to de-risk assumptions, before
  committing to full build.
- Knowing when a prototype has answered its question and it's time to
  either formalize or kill it.
- Exercise: learner scopes a one-day prototype for one of the Unit A3
  objectives and defines what "the prototype has done its job" looks like.

---

## Track B - Agentic SDLC Specialization

Prerequisite: Track A complete. Track B assumes the learner has already
decided (or been told) that an agentic pipeline is the delivery mechanism,
and teaches how to operate inside one.

### Unit B0 - Orientation
- What "Agentic SDLC" means: humans + AI agents collaborating across the
  delivery lifecycle, coordinated through shared state (tickets), not a
  central controller.
- Why FDE framing: own the full loop, embedded, not a stage-gated handoff
  chain.
- Exercise: given a sample ticket, identify every stage it will pass through
  and who/what (human or agent) is responsible at each stage.

### Unit B1 - The Pipeline (choreography vs orchestration)
- Core concept: choreography (agents coordinate peer-to-peer via shared
  state, e.g. ticket labels) vs orchestration (a central controller directs
  every step). Trade-offs of each.
- Reference pattern: a label-based state machine, e.g.
  `stage:<name>-ready / running / done / await / blocked`.
- System of Engagement (where state/status/audit lives - e.g. JIRA) vs
  System of Execution (where the work actually happens - e.g. GitHub).
- Exercise: learner traces a ticket through a label state machine in the
  sandbox project and predicts what happens if a required label is missing.

### Unit B2 - Requirements & Design
- What makes a ticket "agent-ready" vs ambiguous (acceptance criteria,
  scope, non-goals).
- How a Requirements-stage agent/human turns an idea into a buildable spec.
- How a Design-stage agent/human turns a spec into sub-tasks with correct
  dependency links.
- Exercise: learner writes a ticket for a small sandbox feature, then
  reviews it against the "agent-ready" rubric.

### Unit B3 - Build & Handoff
- Branch naming / PR conventions that enable automated traceability
  (type/KEY-summary, PR title referencing the key).
- Working alongside a Dev-stage and Test-stage agent: what the human FDE
  verifies vs what the agent verifies.
- Traceability discipline: why "no ticket, no work" matters at scale.
- Exercise: learner opens a sandbox branch/PR correctly linked to a sandbox
  ticket and gets self-graded on naming/linking correctness.

### Unit B4 - Deploy / Change Management
- What "done" means in an agentic pipeline (labels, not just code merged).
- The FDE's role at cutover: verification, rollback awareness, customer
  communication.
- Exercise: learner walks a sandbox ticket from "build done" to "released"
  and documents the evidence trail.

### Capstone
- A single sandboxed scenario spanning Units B0-B4 (Track B), building on
  the judgment developed in Track A: learner plays FDE across one fake
  ticket from intake to release, working with simulated agent outputs at
  each stage.
- Self-graded against the combined rubric; gaps are logged for human review
  if the learner wants deeper feedback.

### Future extension (not yet built)
- **Retirements domain module** - to be added later as a plug-in case-study
  unit once the core program is validated with a cohort.
- Additional domain modules for other company segments, same plug-in
  pattern.

## Toolkit (what Chiron can and cannot do in this program)

- Read: the FDE Dojo's own curriculum/rubric files, and whatever
  sandbox-scoped example material is provided for a given cohort.
- Write: cohort materials, exercise prompts, and self-grade logs under this
  program's folder only.
- No access to: real company JIRA, real GitHub repos, shell, or any
  production system. All exercises run against sandbox instances the
  learner or program admin provisions.

## Open items

- Finalize rubric format (see `rubrics/` - to be drafted per unit).
- Decide hosting model if this moves beyond a single laptop (local OpenCode
  per learner vs. centrally hosted agent) - tracked as a follow-up decision
  under CRTTIN-8244.
- Confirm GitHub Copilot (or alternate model provider) licensing for
  learners before first cohort runs.
