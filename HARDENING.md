<!-- markdownlint-disable -->

# Hardening Report: yegor256--bibcop-action/0.0.4

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `1`

Action **yegor256--bibcop-action/0.0.4** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The action.yml uses a Docker image reference with a mutable tag instead of an immutable SHA digest. `image: 'docker://yegor256/bibcop-action:0.0.4'` uses the tag `0.0.4`, which can be silently replaced by a different (potentially malicious) image. It should be pinned to a specific SHA256 digest, e.g. `image: 'docker://yegor256/bibcop-action@sha256:<64-hex-char-digest>'`.

Locations:

- `action.yml:11`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Replaced the mutable Docker image tag `docker://yegor256/bibcop-action:0.0.4` with the immutable SHA256 digest `docker://yegor256/bibcop-action@sha256:c43d73a2701d69a1639004f328a3fb71dbe7be67a9aedb92162667c4dc418b6f` in action.yml line 11. The original tag `0.0.4` is preserved as a comment outside the YAML quotes for readability.

