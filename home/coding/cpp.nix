{ pkgs, ... }:
{
  home.packages = with pkgs; [
    clang
    clang-tools
    cmake
    ninja
  ];
}
