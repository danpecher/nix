{ username, ... }:
{
  imports = [
    ./shell.nix
    ./packages.nix
    ./git.nix
  ];

  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "25.11";

    file = {
      ".aerospace.toml".source = ../configs/aerospace.toml;
      ".config/ghostty/config".source = ../configs/ghostty;
      ".config/nvim/init.lua".source = ../configs/nvim/init.lua;
      ".config/kanata/kanata.kbd".source = ../configs/kanata.kbd;
      ".config/mise/config.toml".source = ../configs/mise.toml;
    };
  };

  programs.home-manager.enable = true;
}
