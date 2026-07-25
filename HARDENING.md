<!-- markdownlint-disable -->

# Hardening Report: yegor256--bibcop-action/0.1.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **yegor256--bibcop-action/0.1.0** was hardened automatically. 2 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

Multiple workflow files and action.yml use mutable tag/branch/version refs instead of pinned 40-character SHA commit hashes, making them vulnerable to supply-chain attacks.

- action.yml: `image: 'docker://yegor256/bibcop-action:0.1.0'` — mutable Docker tag instead of SHA digest
- actionlint.yml: `actions/checkout@v7`, `reviewdog/action-actionlint@v1.72.0`
- bashate.yml: `actions/checkout@v7`, `actions/setup-python@v6`
- checkmake.yml: `actions/checkout@v7`, `Uno-Takashi/checkmake-action@v2`
- copyrights.yml: `actions/checkout@v7`, `yegor256/copyrights-action@0.0.12`
- hadolint.yml: `actions/checkout@v7`, `hadolint/hadolint-action@v3.3.0`
- markdown-lint.yml: `actions/checkout@v7`, `DavidAnson/markdownlint-cli2-action@v24.0.0`
- pdd.yml: `actions/checkout@v7`, `volodya-lombrozo/pdd-action@master`
- reuse.yml: `actions/checkout@v7`, `fsfe/reuse-action@v6`
- shellcheck.yml: `actions/checkout@v7`, `ludeeus/action-shellcheck@master`
- test.yml: `actions/checkout@v7`
- typos.yml: `actions/checkout@v7`, `crate-ci/typos@v1.48.0`
- up.yml: `actions/checkout@v7`, `peter-evans/create-pull-request@v8`
- xcop.yml: `actions/checkout@v7`, `g4s8/xcop-action@master`
- yamllint.yml: `actions/checkout@v7`, `ibiqlik/action-yamllint@v3`

Locations:

- `action.yml:11`
- `.github/workflows/actionlint.yml:17`
- `.github/workflows/actionlint.yml:18`
- `.github/workflows/bashate.yml:17`
- `.github/workflows/bashate.yml:18`
- `.github/workflows/checkmake.yml:17`
- `.github/workflows/checkmake.yml:18`
- `.github/workflows/copyrights.yml:13`
- `.github/workflows/copyrights.yml:14`
- `.github/workflows/hadolint.yml:13`
- `.github/workflows/hadolint.yml:14`
- `.github/workflows/markdown-lint.yml:12`
- `.github/workflows/markdown-lint.yml:13`
- `.github/workflows/pdd.yml:17`
- `.github/workflows/pdd.yml:18`
- `.github/workflows/reuse.yml:17`
- `.github/workflows/reuse.yml:18`
- `.github/workflows/shellcheck.yml:17`
- `.github/workflows/shellcheck.yml:18`
- `.github/workflows/test.yml:13`
- `.github/workflows/typos.yml:17`
- `.github/workflows/typos.yml:18`
- `.github/workflows/up.yml:16`
- `.github/workflows/up.yml:18`
- `.github/workflows/xcop.yml:17`
- `.github/workflows/xcop.yml:18`
- `.github/workflows/yamllint.yml:17`
- `.github/workflows/yamllint.yml:18`

### missing-permissions (severity: medium)

None of the 14 workflow files define a top-level `permissions:` key, and no individual job within any of these files defines a `permissions:` key. Without explicit permissions, workflows run with the default (potentially broad) token permissions, violating the principle of least privilege.

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

Fixed all 28 unpinned action references across 14 workflow files plus action.yml:
- action.yml: Pinned Docker image yegor256/bibcop-action:0.1.0 with sha256 digest (preserving docker:// scheme and tag)
- All 14 workflow files: Pinned actions/checkout@v7 → SHA 3d3c42e5aac5ba805825da76410c181273ba90b1
- actionlint.yml: Pinned reviewdog/action-actionlint@v1.72.0 → SHA 6fb7acc99f4a1008869fa8a0f09cfca740837d9d
- bashate.yml: Pinned actions/setup-python@v6 → SHA ece7cb06caefa5fff74198d8649806c4678c61a1
- checkmake.yml: Pinned Uno-Takashi/checkmake-action@v2 → SHA bc11ee86274ceaf5710dbcd80871d7cd7ecc78ce
- copyrights.yml: Pinned yegor256/copyrights-action@0.0.12 → SHA 597733b4b433341822e601cbe3316fd45031fec8
- hadolint.yml: Pinned hadolint/hadolint-action@v3.3.0 → SHA 2332a7b74a6de0dda2e2221d575162eba76ba5e5
- markdown-lint.yml: Pinned DavidAnson/markdownlint-cli2-action@v24.0.0 → SHA 8de2aa07cae85fd17c0b35642db70cf5495f1d25
- pdd.yml: Pinned volodya-lombrozo/pdd-action@master → SHA 69842b56627431c5f232f5ea2dc2fca82f409c54
- reuse.yml: Pinned fsfe/reuse-action@v6 → SHA 676e2d560c9a403aa252096d99fcab3e1132b0f5
- shellcheck.yml: Pinned ludeeus/action-shellcheck@master → SHA 00b27aa7cb85167568cb48a3838b75f4265f2bca
- typos.yml: Pinned crate-ci/typos@v1.48.0 → SHA bee27e3a4fd1ea2111cf90ab89cd076c870fce14
- up.yml: Pinned peter-evans/create-pull-request@v8 → SHA 5f6978faf089d4d20b00c7766989d076bb2fc7f1
- xcop.yml: Pinned g4s8/xcop-action@master → SHA 4e93f123cab886ca8e481a737ee586bc9f02d228
- yamllint.yml: Pinned ibiqlik/action-yamllint@v3 → SHA 2576378a8e339169678f9939646ee3ee325e845c

Added permissions blocks to all 14 workflow files:
- 13 workflows use permissions: {} (read-only linting/checking workflows need no token permissions)
- up.yml uses permissions: {contents: write, pull-requests: write} (minimum needed to create PRs)

