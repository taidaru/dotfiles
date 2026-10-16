{ config, lib, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    sessionVariables.ZSH_DISABLE_COMPFIX = "true";

    shellAliases = {
      sw = "nh os switch";
      upd = "nh os switch --update";
      kali = "distrobox enter --root kali -- zsh";
      # hms = "nh home switch";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        # "python"
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

    initContent = lib.mkBefore ''
      if [[ -n $CONTAINER_ID ]]; then
        ZSH_DISABLE_COMPFIX=true
        path+=(/run/host/run/current-system/etc/profiles/per-user/$USER/bin /run/host/run/current-system/sw/bin)
      fi
    '';

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
  };
}
