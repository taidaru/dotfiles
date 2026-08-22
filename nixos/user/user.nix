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

  services.getty =
    let
      auto = builtins.filter (name: usersConfig.${name}.autologin or false) hostUsers;
    in
    {
      greetingLine = lib.mkForce "";
      helpLine = lib.mkForce "";
    }
    // lib.optionalAttrs (auto != [ ]) {
      extraArgs = [ "--skip-login" ];
      loginOptions = "-f ${builtins.head auto}";
    };
}
