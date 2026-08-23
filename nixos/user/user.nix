{
  lib,
  pkgs,
  hostUsers,
  usersConfig,
  ...
}:

let
  mkUser = name: cfg: {
    name = name;
    value = {
      isNormalUser = cfg.isNormalUser or true;
      extraGroups = cfg.extraGroups or [ ];
      shell = if cfg.shell == "zsh" then pkgs.zsh else pkgs.bash;
    };
  };

in
{
  programs.zsh.enable = true;

  users.users = builtins.listToAttrs (map (name: mkUser name usersConfig.${name}) hostUsers);

  users.defaultUserShell = pkgs.zsh;

  services.getty = {
    greetingLine = lib.mkForce "";
    helpLine = lib.mkForce "";
  };
}
