# Nix Darwin Configuration

macOS system configuration using nix-darwin and home-manager.

## Usage

```bash
# Apply configuration
make darwin

# Or use the shell alias (after first install)
rebuild

# Clean up old generations
make clean
make gc
```

## Structure

```
.
├── flake.nix           # Entry point - defines inputs and system config
├── modules/            # System-level configuration
│   ├── core.nix        # Nix daemon, hostname, user setup
│   ├── system.nix      # macOS defaults (dock, keyboard, finder, etc.)
│   └── apps.nix        # System packages and VSCodium config
├── home/               # User configuration (home-manager)
│   ├── default.nix     # Entry point + dotfile mappings
│   ├── core.nix        # User packages and programs
│   ├── shell.nix       # Zsh config and Starship prompt
│   └── git.nix         # Git configuration
└── configs/            # Application dotfiles
    ├── aerospace.toml  # Window manager
    ├── ghostty         # Terminal
    ├── kanata.kbd      # Keyboard remapping
    ├── mise.toml       # Tool version manager
    └── nvim/init.lua   # Neovim config
```

## First-time Setup

1. Install Nix:
   ```bash
   sh <(curl -L https://nixos.org/nix/install)
   ```

2. **Open a new terminal** (required for nix to be available)

3. Clone this repo:
   ```bash
   git clone <repo-url> ~/code/nix
   cd ~/code/nix
   ```

4. Apply the configuration:
   ```bash
   make darwin
   ```

5. Install tool versions (optional):
   ```bash
   mise install
   ```

## Resources

- [nix-darwin](https://github.com/LnL7/nix-darwin)
- [home-manager](https://github.com/nix-community/home-manager)
- [NixOS and Flakes Book](https://github.com/ryan4yin/nixos-and-flakes-book)
