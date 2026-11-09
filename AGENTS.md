# AGENTS.md

Personal NixOS flake configuration (NixOS 26.05 + home-manager, single user `zet`, host `slmd`).

## Layout

```
flake.nix               inputs; outputs delegated to ./flake/outputs.nix
flake/outputs.nix       auto-discovers hosts/* and users/*, builds nixosConfigurations
flake/lib/mkHost.nix    nixosSystem + home-manager wiring, passes `unstable` via specialArgs
hosts/<name>/           meta.nix (system, users), hardware, host-only modules and `my.*` options
nixos/                  system modules: core, desktop, hardware, network, user, packages
home/                   home-manager modules: terminal, desktop (Hyprland, noctalia), coding, wine, apps
users/<name>/           user.nix (account), home.nix (home-manager entry), packages, git
```

## Conventions

- Every directory has a `default.nix` that only imports its siblings; a new module must be added there.
- Stable packages come from `pkgs`, newer ones from `unstable` (nixos-unstable, available as a module argument in both NixOS and home-manager).
- Host toggles are `my.*` options defined under `hosts/<name>/config/`.
- Android SDK, NDK and emulator are managed by Android Studio itself, not by Nix.
- The host is the live machine: inspect the running system when debugging, not only the Nix code.

## Commands

- Apply: `nh os switch` (alias `sw`), flake path `/persist/nixos-config`.
- Check without applying: `nix flake check` or `nh os build`.
- Format: `nixfmt`.

## Rules

- Never commit. Never push. Leave all changes uncommitted for the user to review.
- Keep comments to a minimum; add one only when the code cannot explain itself.
- Everything in code is strictly English: identifiers, comments, strings.
