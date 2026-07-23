{
  programs.zed-editor = {
    enable = true;

    mutableUserSettings = true;

    extensions = [
      "git-firefly"
      "material-icon-theme"
      "lua"
      "codebook"
      "log"
    ];

    userSettings = {
      server_url = "https://zed.dev";
      icon_theme = "Material Icon Theme";
      restore_on_startup = "last_workspace";
      disable_ai = true;
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
      minimap = {
        max_width_columns = 3;
        show = "always";
        thumb = "always";
        thumb_border = "left_open";
        current_line_highlight = null;
      };
      scrollbar = {
        show = "auto";
        cursors = true;
        git_diff = true;
        search_results = true;
        selected_text = true;
        selected_symbol = true;
        diagnostics = "all";
        axes = {
          horizontal = true;
          vertical = true;
        };
      };
      inlay_hints = {
        enabled = true;
        show_type_hints = true;
        show_parameter_hints = true;
        show_other_hints = true;
        show_background = false;
        edit_debounce_ms = 700;
        scroll_debounce_ms = 50;
        toggle_on_modifiers_press = null;
      };
      relative_line_numbers = "enabled";
      diagnostics = {
        button = true;
        include_warnings = true;
        lsp_pull_diagnostics = {
          enabled = true;
          debounce_ms = 50;
        };
        inline = {
          enabled = true;
          update_debounce_ms = 150;
          padding = 4;
          min_column = 0;
          max_severity = null;
        };
      };
      vim_mode = false;
      ui_font_size = 16;
      buffer_font_size = 15;
      theme = {
        mode = "dark";
        light = "Ayu Mirage";
        dark = "One Dark";
      };
      proxy = "socks5://127.0.0.1:20217";
    };
  };
}
