{...}: {
  programs.nvf = {
    enable = true;
    settings.vim = {
      autocomplete.nvim-cmp.enable = true;
      autopairs.nvim-autopairs.enable = true;
      binds.whichKey.enable = true;
      diagnostics = {
        enable = true;
      };
      filetree.neo-tree = {
        enable = true;
        setupOpts = {
          enable_cursor_hijack = true;
          git_status_async = true;
        };
      };
      formatter.conform-nvim = {
        enable = true;
      };
      hideSearchHighlight = true;
      languages = {
        enableFormat = true;
        enableTreesitter = true;
        bash.enable = true;
        css.enable = true;
        css.format.type = ["prettierd"];
        html.enable = true;
        nix.enable = true;
        markdown.enable = true;
        python.enable = true;
        ts.format.type = ["prettierd"];
      };
      lsp = {
        enable = true;
        formatOnSave = true;
        lspkind.enable = true;
        lspsaga.enable = true;
        lspSignature.enable = true;
        trouble.enable = true;
      };
      mini = {
        animate.enable = true;
        indentscope.enable = true;
      };
      minimap.codewindow.enable = true;
      notify.nvim-notify.enable = true;
      options = {
        autoindent = true;
        mouse = "cv";
      };
      statusline = {
        lualine = {
          enable = true;
          theme = "dracula";
        };
      };
      theme = {
        enable = true;
        name = "dracula";
        transparent = false;
      };
      treesitter.indent.enable = false;
      ui = {
        breadcrumbs.enable = true;
        colorizer.enable = true;
        modes-nvim.enable = true;
        smartcolumn.enable = true;
      };
      visuals = {
        cinnamon-nvim.enable = true;
        fidget-nvim.enable = true;
        highlight-undo.enable = true;
        indent-blankline.enable = true;
        nvim-cursorline.enable = true;
        nvim-scrollbar.enable = true;
        nvim-web-devicons.enable = true;
      };
    };
  };
}
