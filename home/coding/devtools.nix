{ pkgs, ... }:
{
  home.packages = with pkgs; [
    clang
    clang-tools
    cmake
    ninja
    protobuf
    openapi-generator-cli
    git-filter-repo
    cargo-dist
    just
  ];
}
