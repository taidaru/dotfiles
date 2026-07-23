{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    withRuby = false;
    withPython3 = false;
    extraPackages = with pkgs; [
      # lua-language-server
      # python311Packages.python-lsp-server
      # nixd
      # vimPlugins.nvim-treesitter-parsers.hyprlang
    ];
  };
}
