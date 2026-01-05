{
  pkgs,
  lib,
  username,
  hostname,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;

  # Host configuration
  networking.hostName = hostname;
  networking.computerName = hostname;
  system.defaults.smb.NetBIOSName = hostname;

  # User configuration
  users.users."${username}" = {
    home = "/Users/${username}";
    description = username;
  };
  system.primaryUser = username;

  # Nix daemon configuration
  nix = {
    # Determinate uses its own daemon that conflicts with nix-darwin's management.
    # Set to false if using Determinate Nix, then manually edit /etc/nix/nix.custom.conf
    enable = true;
    package = pkgs.nix;

    settings = {
      experimental-features = ["nix-command" "flakes"];
      trusted-users = [username];
    };

    # Garbage collection weekly
    gc = {
      automatic = lib.mkDefault true;
      options = lib.mkDefault "--delete-older-than 7d";
    };
  };
}
