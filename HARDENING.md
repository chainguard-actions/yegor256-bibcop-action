<!-- markdownlint-disable -->

# Hardening Report: yegor256--bibcop-action/0.1.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `1`

Action **yegor256--bibcop-action/0.1.0** was hardened automatically. 2 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

All workflow files use mutable tag or branch references instead of pinned 40-character SHA commit hashes. This exposes the action to supply-chain attacks if any referenced action is compromised or its tag is moved. Affected references include: actions/checkout@v7, reviewdog/action-actionlint@v1.72.0, actions/setup-python@v6, Uno-Takashi/checkmake-action@v2, yegor256/copyrights-action@0.0.12, hadolint/hadolint-action@v3.3.0, DavidAnson/markdownlint-cli2-action@v24.0.0, volodya-lombrozo/pdd-action@master, fsfe/reuse-action@v6, ludeeus/action-shellcheck@master, crate-ci/typos@v1.48.0, peter-evans/create-pull-request@v8, g4s8/xcop-action@master, ibiqlik/action-yamllint@v3. Additionally, action.yml references a Docker image by mutable tag (docker://yegor256/bibcop-action:0.1.0) instead of a SHA digest.

Locations:

- `.github/workflows/actionlint.yml:17`
- `.github/workflows/actionlint.yml:18`
- `.github/workflows/bashate.yml:17`
- `.github/workflows/bashate.yml:18`
- `.github/workflows/checkmake.yml:17`
- `.github/workflows/checkmake.yml:18`
- `.github/workflows/copyrights.yml:14`
- `.github/workflows/copyrights.yml:15`
- `.github/workflows/hadolint.yml:14`
- `.github/workflows/hadolint.yml:15`
- `.github/workflows/markdown-lint.yml:13`
- `.github/workflows/markdown-lint.yml:14`
- `.github/workflows/pdd.yml:17`
- `.github/workflows/pdd.yml:18`
- `.github/workflows/reuse.yml:17`
- `.github/workflows/reuse.yml:18`
- `.github/workflows/shellcheck.yml:17`
- `.github/workflows/shellcheck.yml:18`
- `.github/workflows/test.yml:13`
- `.github/workflows/typos.yml:17`
- `.github/workflows/typos.yml:18`
- `.github/workflows/up.yml:15`
- `.github/workflows/up.yml:22`
- `.github/workflows/xcop.yml:17`
- `.github/workflows/xcop.yml:18`
- `.github/workflows/yamllint.yml:17`
- `.github/workflows/yamllint.yml:18`
- `action.yml:11`

### missing-permissions (severity: medium)

None of the 14 workflow files define a top-level `permissions:` block, and no job within any of these files defines a job-level `permissions:` block. Without explicit permissions, GitHub Actions grants the default token permissions (which may include write access to repository contents, pull requests, etc.), violating the principle of least privilege.

Locations:

- `.github/workflows/actionlint.yml:1`
- `.github/workflows/bashate.yml:1`
- `.github/workflows/checkmake.yml:1`
- `.github/workflows/copyrights.yml:1`
- `.github/workflows/hadolint.yml:1`
- `.github/workflows/markdown-lint.yml:1`
- `.github/workflows/pdd.yml:1`
- `.github/workflows/reuse.yml:1`
- `.github/workflows/shellcheck.yml:1`
- `.github/workflows/test.yml:1`
- `.github/workflows/typos.yml:1`
- `.github/workflows/up.yml:1`
- `.github/workflows/xcop.yml:1`
- `.github/workflows/yamllint.yml:1`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses, missing-permissions

**Notes:**

Fixed all 14 workflow files and action.yml:

1. unpinned-uses: Pinned all action references to full 40-character SHA commit hashes with original tag/version preserved as comments:
   - actions/checkout@v7 → @9c091bb21b7c1c1d1991bb908d89e4e9dddfe3e0
   - reviewdog/action-actionlint@v1.72.0 → @6fb7acc99f4a1008869fa8a0f09cfca740837d9d
   - actions/setup-python@v6 → @ece7cb06caefa5fff74198d8649806c4678c61a1
   - Uno-Takashi/checkmake-action@v2 → @bc11ee86274ceaf5710dbcd80871d7cd7ecc78ce
   - yegor256/copyrights-action@0.0.12 → @597733b4b433341822e601cbe3316fd45031fec8
   - hadolint/hadolint-action@v3.3.0 → @2332a7b74a6de0dda2e2221d575162eba76ba5e5
   - DavidAnson/markdownlint-cli2-action@v24.0.0 → @8de2aa07cae85fd17c0b35642db70cf5495f1d25
   - volodya-lombrozo/pdd-action@master → @69842b56627431c5f232f5ea2dc2fca82f409c54
   - fsfe/reuse-action@v6 → @676e2d560c9a403aa252096d99fcab3e1132b0f5
   - ludeeus/action-shellcheck@master → @00b27aa7cb85167568cb48a3838b75f4265f2bca
   - crate-ci/typos@v1.48.0 → @bee27e3a4fd1ea2111cf90ab89cd076c870fce14
   - peter-evans/create-pull-request@v8 → @5f6978faf089d4d20b00c7766989d076bb2fc7f1
   - g4s8/xcop-action@master → @4e93f123cab886ca8e481a737ee586bc9f02d228
   - ibiqlik/action-yamllint@v3 → @2576378a8e339169678f9939646ee3ee325e845c
   - action.yml Docker image yegor256/bibcop-action:0.1.0 → pinned to sha256:2beedec71b51940588be2f3b3f6207ad01d678c90a4d368cbc3f8a305b86fc40

2. missing-permissions: Added `permissions: {}` top-level block to all 14 workflow files. For up.yml which creates pull requests, added job-level permissions (contents: write, pull-requests: write) while keeping the top-level block as `{}`.

