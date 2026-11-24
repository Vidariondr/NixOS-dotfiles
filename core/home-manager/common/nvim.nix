{...}: {
  programs.nvf = {
    enable = true;
    settings.vim = {
      clipboard.registers = "unnamedplus";
      comments.comment-nvim.enable = true;
      git = {
        enable = true;
        gitsigns.enable = true;
      };
      telescope.enable = true;
      terminal.toggleterm.enable = true;
      utility.surround.enable = true;
      autocomplete.nvim-cmp.enable = false;
      autocomplete.blink-cmp.enable = true;
      autocomplete.blink-cmp.setupOpts.signature.enabled = true;
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
        css.format.type = ["prettier"];
        html.enable = true;
        nix.enable = true;
        nix.lsp.servers = ["nixd"];
        markdown.enable = true;
        python.enable = true;
        python.format.type = ["ruff"];
        typescript.enable = true;
        typescript.format.type = ["prettier"];
        toml.enable = true;
        yaml.enable = true;
      };
      lsp = {
        enable = true;
        formatOnSave = true;
        lspkind.enable = true;
        lspsaga.enable = true;
        trouble.enable = true;
      };
      mini = {
        animate.enable = true;
        indentscope.enable = true;
      };
      notify.nvim-notify.enable = true;
      options = {
        autoindent = true;
        mouse = "cv";
        shiftwidth = 2;
        tabstop = 2;
        softtabstop = 2;
        expandtab = true;
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
      treesitter.context.enable = false;
      ui = {
        breadcrumbs.enable = true;
        colorizer.enable = true;
        modes-nvim.enable = true;
        smartcolumn.enable = true;
      };
      visuals = {
        fidget-nvim.enable = true;
        highlight-undo.enable = true;
        indent-blankline.enable = true;
        nvim-cursorline.enable = true;
        nvim-scrollbar.enable = true;
        nvim-web-devicons.enable = true;
        rainbow-delimiters.enable = true;
      };
    };
  };
}
