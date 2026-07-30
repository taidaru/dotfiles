{ pkgs, ... }:
{
  home.packages = with pkgs; [
    clang
    cmake
    ninja
    protobuf
    openapi-generator-cli
    git-filter-repo
    cargo-dist
    just
  ];
}
