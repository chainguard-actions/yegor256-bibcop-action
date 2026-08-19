<!-- markdownlint-disable -->

# Hardening Report: yegor256--bibcop-action/0.0.1

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **yegor256--bibcop-action/0.0.1** was hardened automatically. 2 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

Multiple workflow files reference GitHub Actions using mutable tags or branch names instead of pinned full-length SHA digests, making the action vulnerable to supply-chain attacks if the referenced action is compromised or modified.

- .github/workflows/markdown-lint.yml: `articulate/actions-markdownlint@v1` (mutable tag)
- .github/workflows/shellcheck.yml: `actions/checkout@v4` (mutable tag), `ludeeus/action-shellcheck@master` (mutable branch)
- .github/workflows/test.yml: `actions/checkout@v4` (mutable tag)
- .github/workflows/up.yml: `actions/checkout@v4` (mutable tag), `peter-evans/create-pull-request@v6` (mutable tag)

Locations:

- `.github/workflows/markdown-lint.yml:11`
- `.github/workflows/shellcheck.yml:13`
- `.github/workflows/shellcheck.yml:14`
- `.github/workflows/test.yml:8`
- `.github/workflows/up.yml:10`
- `.github/workflows/up.yml:18`

### missing-permissions (severity: medium)

None of the workflow files define a `permissions:` block at the top level or at the job level. Without explicit permissions, workflows run with the default (potentially broad) GITHUB_TOKEN permissions, violating the principle of least privilege. Affected files: markdown-lint.yml, shellcheck.yml, test.yml, up.yml.

Locations:

- `.github/workflows/markdown-lint.yml:1`
- `.github/workflows/shellcheck.yml:1`
- `.github/workflows/test.yml:1`
- `.github/workflows/up.yml:1`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses, missing-permissions

**Notes:**

Fixed all four workflow files:

1. markdown-lint.yml: Pinned `articulate/actions-markdownlint@v1` → SHA `17b8abe7407cd17590c006ecc837c35e1ac3ed83`; added `permissions: {}`.

2. shellcheck.yml: Pinned `actions/checkout@v4` → SHA `34e114876b0b11c390a56381ad16ebd13914f8d5`; pinned `ludeeus/action-shellcheck@master` → SHA `00b27aa7cb85167568cb48a3838b75f4265f2bca`; added `permissions: {}`.

3. test.yml: Pinned `actions/checkout@v4` → SHA `34e114876b0b11c390a56381ad16ebd13914f8d5`; added `permissions: {}`.

4. up.yml: Pinned `actions/checkout@v4` → SHA `34e114876b0b11c390a56381ad16ebd13914f8d5`; pinned `peter-evans/create-pull-request@v6` → SHA `c5a7806660adbe173f04e3e038b0ccdcd758773c`; added `permissions: { contents: write, pull-requests: write }` (needed for creating PRs and modifying README).

All original tags/branches preserved as inline comments for readability.

