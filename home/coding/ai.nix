{
  pkgs,
  unstable,
  ...
}:
{

  home.packages =
    with pkgs;
    [ ]
    ++ (with unstable; [
      claude-code
    ]);

}
