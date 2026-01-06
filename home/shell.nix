{...}: {
  # Starship prompt
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    settings = {
      character = {
        success_symbol = "[›](bold green)";
        error_symbol = "[›](bold red)";
      };
      aws.symbol = "🅰 ";
      gcloud = {
        # Hide account/project info to avoid leaking sensitive info when sharing terminal
        format = "on [$symbol$active(\($region\))]($style) ";
        symbol = "🅶 ️";
      };
    };
  };

  programs.zsh = {
    enable = true;
      
    # History settings
    history = {
      size = 50000;
      save = 50000;
      extended = true;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      share = true;
    };

    # Shell options
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      # Navigation
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      # List files (using eza)
      ls = "eza";
      ll = "eza -la --icons --git";
      la = "eza -a --icons";
      lt = "eza --tree --icons";

      # Better defaults
      cat = "bat";
      find = "fd";
      grep = "rg";

      # Git
      g = "git";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git pull";
      gd = "git diff";
      gco = "git checkout";
      gb = "git branch";
      glog = "git log --oneline --graph --decorate";

      # GitHub CLI
      ghpr = "gh pr create";
      ghpv = "gh pr view --web";

      # lazygit
      lg = "lazygit";

      # Shortcuts
      c = "clear";
      h = "history";
      j = "jobs -l";
      path = "echo -e \${PATH//:/\\\\n}";
      now = "date +\"%T\"";
      today = "date +\"%Y-%m-%d\"";

      # Safety (use trash instead of rm)
      rm = "trash";
      cp = "cp -i";
      mv = "mv -i";

      # Nix-darwin
      rebuild = "darwin-rebuild switch --flake ~/code/nix";
    };

    initContent = ''
      # mise - Development tool version manager
      if command -v mise &>/dev/null; then
          eval "$(mise activate zsh)"
      fi

      # Starship prompt
      if command -v starship &>/dev/null; then
          eval "$(starship init zsh)"
      fi

      # zoxide - smarter cd
      if command -v zoxide &>/dev/null; then
          eval "$(zoxide init zsh --cmd cd)"
      fi

      # Completion settings
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

      # Local configuration (not managed by nix)
      if [[ -f ~/.zshrc.local ]]; then
          source ~/.zshrc.local
      fi
    '';
  };
}
