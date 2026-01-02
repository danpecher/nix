{pkgs, ...}: {
  home.packages = with pkgs; [
    # CLI Essentials
    git
    gh              # GitHub CLI
    wget
    curl
    jq              # JSON processing
    yq              # YAML processing
    aria2
    gnupg

    # Modern CLI replacements
    ripgrep         # Fast search (rg)
    fd              # Better find
    fzf             # Fuzzy finder
    bat             # Better cat
    # eza             # Better ls
    zoxide          # Smarter cd
    duf             # Better df
    dust            # Better du
    tree
    htop
    trash-cli       # Move to trash instead of rm
    xh              # Better curl for APIs
    # yazi            # Terminal file manager
    mcfly           # Better shell history
    navi            # Interactive cheatsheet
    glow            # Makrdown

    # Shell & Terminal
    starship        # Cross-shell prompt

    # Development Tools
    lazygit         # Terminal UI for git
    delta           # Better git diffs
    mise
  ];

  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      profiles.default = {
        extensions = with pkgs.vscode-extensions; [
          vscodevim.vim
          # anthropic.claude-code
        ];
        userSettings = {
          "workbench.colorTheme" = "Visual Studio Dark";
          "claudeCode.preferredLocation" = "sidebar";
          "claudeCode.selectedModel" = "opus";
          "git.autofetch" = true;
          "workbench.editorAssociations" = {
              "*.md" = "vscode.markdown.preview.editor";
          };
          "workbench.startupEditor" = "none";
        };
      };
    };

    # modern vim
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };

    # A modern replacement for ‘ls’
    # useful in bash/zsh prompt, not in nushell.
    eza = {
      enable = true;
      git = true;
      icons = "auto";
      enableZshIntegration = true;
    };

    # terminal file manager
    yazi = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        manager = {
          show_hidden = true;
          sort_dir_first = true;
        };
      };
    };
  };
}
