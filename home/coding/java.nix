{ pkgs, ... }:
{
  home.packages = with pkgs; [
    javaPackages.compiler.openjdk21
  ];
}
