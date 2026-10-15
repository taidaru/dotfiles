{ unstable, ... }:
{
  home.packages = [
    unstable.ghidra
  ];

  home.sessionVariables.GHIDRA_INSTALL_DIR = "${unstable.ghidra}/lib/ghidra";
}
