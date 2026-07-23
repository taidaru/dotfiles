{
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

  services.getty.autologinUser =
    let
      auto = builtins.filter (name: usersConfig.${name}.autologin or false) hostUsers;
    in
    if auto == [ ] then null else builtins.head auto;
}
