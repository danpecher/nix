{pkgs, ...}: {
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
  };
}
