# Rules

- When a package is desired but unavailable, NEVER install it globally; MAY use alternatives:
  - Python: `nix shell nixpkgs#uv -c uvx pycowsay moo`, `nix shell nixpkgs#uv -c uv run --with rich example.py`
  - JavaScript: `nix shell nixpkgs#bun -c bunx cowsay moo`, `nix shell nixpkgs#bun -c bunx --package @angular/cli ng`
  - Other: `nix run nixpkgs#cowsay moo`, `nix shell nixpkgs#ffmpeg -c ffmpeg -version`
- When instructed to write to `docs/superpowers`, MUST use `.superpowers` instead.

# Commit Messages

SHOULD use Linux Kernel commit message style:

```
[scope]: Short imperative summary of the change

# Problem

Describe the problem: explain the current behavior, why it is
problematic, broken, or suboptimal, and under what conditions the
issue occurs.

# Solution

Explain the solution: describe what this change does to resolve the
problem. Detail any non-obvious design choices, trade-offs, or side
effects that the reader should be aware of.

# References

Provide context and references: cite relevant issue trackers, design
documents, specifications, or prior commits (such as the commit that
introduced the regression) to ensure historical traceability.
```
