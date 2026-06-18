<!-- markdownlint-disable -->

# Hardening Report: yegor256--bibcop-action/0.0.2

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `1`

Action **yegor256--bibcop-action/0.0.2** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The action.yml uses a Docker image reference with a mutable tag instead of an immutable SHA digest. The image 'docker://yegor256/bibcop-action0.0.2' is referenced by tag (version string embedded in the image name), not by a SHA256 digest (e.g., @sha256:<64-hex-char-digest>). This means the image could be silently replaced with a different version, enabling supply-chain attacks.

Locations:

- `action.yml:28`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Fixed the unpinned Docker image reference in action.yml. Changed 'docker://yegor256/bibcop-action0.0.2' (mutable tag embedded in image name) to 'docker://yegor256/bibcop-action@sha256:5d24d376415084dd1e8cf18cc090553e79da53c7bc49c1b2d7122470d9c57848' (immutable SHA256 digest) with a '# 0.0.2' comment for readability. The digest was resolved via the Docker Registry API for the image yegor256/bibcop-action:0.0.2.

