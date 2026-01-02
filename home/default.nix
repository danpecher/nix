{ username, ... }:

{
  # import sub modules
  imports = [
    ./shell.nix
    ./core.nix
    ./git.nix
    ./starship.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = username;
    homeDirectory = "/Users/${username}";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "25.11";

    file = {
      ".aerospace.toml".source = ../configs/aerospace.toml;

      ".config/ghostty/config".source = ../configs/ghostty/config;

      ".config/nvim/init.lua".source = ../configs/nvim/init.lua;

      ".config/kanata/kanata.kbd".source = ../configs/kanata.kbd;

      ".config/mise/config.toml".source = ../configs/mise.toml;

      # ".ssh/config".source = ../private_dot_ssh/config;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
