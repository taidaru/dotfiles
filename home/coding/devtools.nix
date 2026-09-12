{ pkgs, ... }:
{
  home.packages = with pkgs; [
    protobuf
    openapi-generator-cli
    git-filter-repo
    cargo-dist
    just
  ];
}
