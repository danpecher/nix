{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  # System-wide packages (available to all users)
  environment.systemPackages = with pkgs; [
    neovim
    git
    just # command runner
  ];

  # VSCodium (via home-manager for user-level config)
  home-manager.sharedModules = [{
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      profiles.default = {
        extensions = with pkgs.vscode-extensions; [
          vscodevim.vim
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

          # Vim settings
          "vim.leader" = "<space>";
          "vim.easymotion" = true;
          "vim.easymotionKeys" = "hklyuiopnm,qwertzxcvbasdgjf;";
        };
      };
    };
  }];
}
