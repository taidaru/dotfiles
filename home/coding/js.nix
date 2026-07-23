{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_22
    typescript
    bun
  ];
}
