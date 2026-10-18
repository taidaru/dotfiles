{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_22
    typescript
    bun
    prisma_7
    prisma-engines_7
  ];
}
