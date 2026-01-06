{pkgs, pkgs-unstable, ...}:
let
  vscodeSettings = import ./vscode-settings.nix;
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
    tmux

    # Development Tools
    lazygit
    delta           # better git diffs
    pkgs-unstable.mise  # Using unstable for latest version
    pkgs-unstable.claude-code

    # macOS GUI Apps
    ghostty-bin
    orbstack
    rapidapi
    tableplus
    # proxyman - package not available
    insomnia
    raycast
    notion-app
    aerospace
    monitorcontrol
    # vial - package not available
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
          # (anthropic.claude-code.overrideAttrs (old: rec {
          #   version = "2.0.75";
          #   src = pkgs.fetchurl {
          #     url = "https://anthropic.gallery.vsassets.io/_apis/public/gallery/publisher/anthropic/extension/claude-code/${version}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage";
          #     name = "anthropic.claude-code-${version}.zip";
          #     hash = "sha256-PA7eL4TZTFYVlImXnZCw6aWjrLXl7/KndnkU3D2t1jw=";
          #   };
          # }))
          vscodevim.vim
          eamodio.gitlens
          bbenoist.nix
        ];
        userSettings = vscodeSettings;
      };
    };
  };
}
