{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withRuby = false;
    withPython3 = false;
    withNodeJs = false;

    plugins = with pkgs.vimPlugins; [
      base16-nvim

      lualine-nvim
      bufferline-nvim
      nvim-web-devicons
      alpha-nvim
      noice-nvim
      nui-nvim
      nvim-notify
      indent-blankline-nvim
      which-key-nvim
      gitsigns-nvim

      nvim-treesitter.withAllGrammars
      plenary-nvim
      telescope-nvim
      neo-tree-nvim
      nvim-lspconfig
      blink-cmp
      friendly-snippets
      nvim-autopairs
    ];

    extraPackages = with pkgs; [
      nixd
      lua-language-server
      rust-analyzer
      gopls
      pyright
      typescript-language-server
      ripgrep
      fd
    ];

    extraLuaConfig = builtins.readFile ./neovim.lua;
  };
}
