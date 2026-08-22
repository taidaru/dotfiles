# nixos-config

Personal NixOS flake configuration.

## Layout

```
flake.nix          # inputs, delegates outputs to ./flake
flake/              # flake outputs, host/user wiring, lib helpers
hosts/<name>/       # per-host hardware + config (e.g. slmd)
nixos/               # system-level modules (core, desktop, hardware, network, user)
home/               # home-manager modules (desktop, terminal, coding, apps)
users/               # per-user definitions
```

## Usage

```sh
sw
```
