{pkgs, ...}:
let
  vscodeSettings = {
    "workbench.colorTheme" = "Visual Studio Dark";
    "claudeCode.preferredLocation" = "sidebar";
    "claudeCode.selectedModel" = "opus";
    "git.autofetch" = true;
    "workbench.editorAssociations" = {
      "*.md" = "vscode.markdown.preview.editor";
    };
    "workbench.startupEditor" = "none";
    "vim.leader" = "<space>";
    "vim.easymotion" = true;
    "vim.easymotionKeys" = "hklyuiopnm,qwertzxcvbasdgjf;";
  };
in {
  home.packages = with pkgs; [
    # CLI Essentials
    git
    gh
    wget
    curl
    jq
    yq
    aria2
    gnupg
    tmux

    # Modern CLI replacements
    ripgrep         # rg - fast search
    fd              # better find
    fzf             # fuzzy finder
    bat             # better cat
    zoxide          # smarter cd
    duf             # better df
    dust            # better du
    tree
    htop
    trash-cli       # move to trash instead of rm
    xh              # better curl for APIs
    mcfly           # better shell history
    navi            # interactive cheatsheet
    glow            # markdown viewer

    # Shell & Terminal
    starship

    # Development Tools
    lazygit
    delta           # better git diffs
    mise

    # macOS GUI Apps
    ghostty-bin
    orbstack
    rapidapi
    tableplus
    # proxyman - package not available 
    insomnia
    raycast
    notion-app
    claude-code
    aerospace
    monitorcontrol
  ];

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };

    eza = {
      enable = true;
      git = true;
      icons = "auto";
      enableZshIntegration = true;
    };

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

    vscode = {
      enable = true;
      package = pkgs.vscodium;
      profiles.default = {
        extensions = with pkgs.vscode-extensions; [
          vscodevim.vim
        ];
        userSettings = vscodeSettings;
      };
    };
  };
}
