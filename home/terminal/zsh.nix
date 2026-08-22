{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
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

    profileExtra = ''
      if command -v uwsm > /dev/null && uwsm check may-start; then
        if [ -n "$MY_AQ_DRM_ORDER" ]; then
          _aq=""
          for _p in ''${=MY_AQ_DRM_ORDER}; do
            _aq="''${_aq:+$_aq:}''${_p:A}"
          done
          export AQ_DRM_DEVICES="$_aq"
        fi
        exec uwsm start hyprland-uwsm.desktop > /dev/null 2>&1
      fi
    '';
  };
}
