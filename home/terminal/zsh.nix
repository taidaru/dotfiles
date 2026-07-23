{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases =
      let
        flakeDir = "persist/nixos-config";
      in
      {
        sw = "nh os switch";
        upd = "nh os switch --update";
        hms = "nh home switch";
      };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "python"
        "man"
      ];

      theme = "robbyrussell";
    };

    plugins = with pkgs; [
      {
        name = "zsh-completions";
        src = pkgs.zsh-completions;
      }
      {
        name = "zsh-autocomplete";
        src = pkgs.zsh-autocomplete;
      }
    ];

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
  };
}
