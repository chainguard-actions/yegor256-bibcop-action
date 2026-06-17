<!-- markdownlint-disable -->

# Hardening Report: yegor256--bibcop-action/0.0.3

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `1`

Action **yegor256--bibcop-action/0.0.3** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The action.yml references a Docker image using a mutable tag rather than an immutable SHA digest. The image 'docker://yegor256/bibcop-action:0.0.3' could be replaced at any time with a different (potentially malicious) image without changing the tag, creating a supply-chain risk. It should be pinned to a specific SHA256 digest, e.g. 'docker://yegor256/bibcop-action@sha256:<64-hex-char-digest>'.

Locations:

- `action.yml:32`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Replaced mutable Docker image tag 'docker://yegor256/bibcop-action:0.0.3' with immutable SHA256 digest 'docker://yegor256/bibcop-action@sha256:65dd1ed06179a2627617a046f125a01afc323a59625bd0578e16ca236fc318cb' in action.yml line 32. The original tag is preserved as a comment outside the YAML string quotes for readability.

