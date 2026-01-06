{pkgs, pkgs-unstable, ...}:
let
  vscodeSettings = {
    # Editor settings
    "editor.fontFamily" = "'FiraCode Nerd Font', 'Fira Code', monospace";
    "editor.fontLigatures" = true;
    "editor.lineNumbers" = "relative";
    "editor.cursorSurroundingLines" = 8;
    # "editor.minimap.enabled" = false;
    "editor.renderWhitespace" = "selection";

    # Workbench appearance
    "workbench.colorTheme" = "Visual Studio Dark";
    "workbench.startupEditor" = "none";
    "workbench.statusBar.visible" = false;
    "workbench.navigationControl.enabled" = false;
    "workbench.layoutControl.enabled" = false;
    "breadcrumbs.enabled" = false;

    # File associations
    "workbench.editorAssociations" = {
      "*.md" = "vscode.markdown.preview.editor";
    };

    # File management
    # "files.autoSave" = "onFocusChange";
    "files.trimTrailingWhitespace" = true;
    "files.insertFinalNewline" = true;
    "files.exclude" = {
      "**/.git" = true;
      "**/.DS_Store" = true;
      "**/node_modules" = true;
      "**/__pycache__" = true;
      "**/.pytest_cache" = true;
    };
    "search.exclude" = {
      "**/node_modules" = true;
      "**/dist" = true;
      "**/build" = true;
      "**/.git" = true;
    };

    # Git settings
    "git.autofetch" = true;
    "git.confirmSync" = false;
    "git.decorations.enabled" = true;
    # "git.enableSmartCommit" = true;
    "scm.diffDecorations" = "gutter";
    "diffEditor.ignoreTrimWhitespace" = false;
    "merge-conflict.autoNavigateNextConflict.enabled" = true;

    # GitLens settings (since you have it installed)
    "gitlens.currentLine.enabled" = true;
    "gitlens.currentLine.format" = "\${author}, \${agoOrDate}";
    "gitlens.hovers.currentLine.over" = "line";
    "gitlens.codeLens.enabled" = false;

    # Vim settings
    "vim.leader" = "<space>";
    "vim.easymotion" = true;
    "vim.easymotionKeys" = "hklyuiopnm,qwertzxcvbasdgjf;";
    "vim.useSystemClipboard" = true;
    "vim.highlightedyank.enable" = true;

    # Extension settings
    "claudeCode.preferredLocation" = "sidebar";

    # Telemetry & privacy
    "telemetry.telemetryLevel" = "off";
    "update.showReleaseNotes" = false;
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
