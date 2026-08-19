<!-- markdownlint-disable -->

# Hardening Report: yegor256--bibcop-action/0.0.3

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **yegor256--bibcop-action/0.0.3** was hardened automatically. 2 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

Multiple workflow files and action.yml use mutable tag/branch refs instead of pinned full SHA commits, making them vulnerable to supply-chain attacks if the referenced action or image is updated maliciously.

action.yml: `image: docker://yegor256/bibcop-action:0.0.3` — uses a mutable Docker tag instead of a SHA digest.

checkmake.yml: `actions/checkout@v4`, `Uno-Takashi/checkmake-action@main`
copyrights.yml: `actions/checkout@v4`, `yegor256/copyrights-action@0.0.4`
hadolint.yml: `actions/checkout@v4`, `hadolint/hadolint-action@v3.1.0`
markdown-lint.yml: `actions/checkout@v4`, `articulate/actions-markdownlint@v1`
shellcheck.yml: `actions/checkout@v4`, `ludeeus/action-shellcheck@master`
test.yml: `actions/checkout@v4`
up.yml: `actions/checkout@v4`, `peter-evans/create-pull-request@v6`
yamllint.yml: `actions/checkout@v4`, `ibiqlik/action-yamllint@v3`

Locations:

- `action.yml:31`
- `.github/workflows/checkmake.yml:35`
- `.github/workflows/checkmake.yml:36`
- `.github/workflows/copyrights.yml:33`
- `.github/workflows/copyrights.yml:34`
- `.github/workflows/hadolint.yml:33`
- `.github/workflows/hadolint.yml:34`
- `.github/workflows/markdown-lint.yml:32`
- `.github/workflows/markdown-lint.yml:33`
- `.github/workflows/shellcheck.yml:35`
- `.github/workflows/shellcheck.yml:36`
- `.github/workflows/test.yml:32`
- `.github/workflows/up.yml:33`
- `.github/workflows/up.yml:40`
- `.github/workflows/yamllint.yml:35`
- `.github/workflows/yamllint.yml:36`

### missing-permissions (severity: medium)

None of the workflow files define a top-level `permissions:` block, and no job within any workflow defines its own `permissions:` block. Without explicit permissions, workflows run with the default (potentially broad) token permissions, violating the principle of least privilege.

Locations:

- `.github/workflows/checkmake.yml:1`
- `.github/workflows/copyrights.yml:1`
- `.github/workflows/hadolint.yml:1`
- `.github/workflows/markdown-lint.yml:1`
- `.github/workflows/shellcheck.yml:1`
- `.github/workflows/test.yml:1`
- `.github/workflows/up.yml:1`
- `.github/workflows/yamllint.yml:1`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses, missing-permissions

**Notes:**

Fixed all unpinned action references by resolving full commit SHAs: actions/checkout@v4 → 11d5960a, Uno-Takashi/checkmake-action@main → 262a3464, yegor256/copyrights-action@0.0.4 → 338e79c1, hadolint/hadolint-action@v3.1.0 → 54c9adba, articulate/actions-markdownlint@v1 → 17b8abe7, ludeeus/action-shellcheck@master → 00b27aa7, peter-evans/create-pull-request@v6 → c5a7806, ibiqlik/action-yamllint@v3 → 2576378a. Pinned Docker image in action.yml to sha256:65dd1ed0 while preserving docker:// scheme and tag. Added permissions: {} to all read-only workflow files (checkmake, copyrights, hadolint, markdown-lint, shellcheck, test, yamllint) and permissions: {contents: write, pull-requests: write} to up.yml which creates pull requests.

