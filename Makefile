HOSTNAME := dan-mbp

.PHONY: help darwin darwin-debug up upp history repl clean gc fmt gcroot

# List all the make commands
help:
	@echo "Available targets:"
	@echo "  darwin       - Build and switch to darwin configuration"
	@echo "  darwin-debug - Build and switch with debug output"
	@echo "  up           - Update all flake inputs"
	@echo "  upp INPUT=x  - Update specific input"
	@echo "  history      - List all generations of the system profile"
	@echo "  repl         - Open a nix shell with the flake"
	@echo "  clean        - Remove all generations older than 7 days"
	@echo "  gc           - Garbage collect all unused nix store entries"
	@echo "  fmt          - Format the nix files in this repo"
	@echo "  gcroot       - Show all the auto gc roots in the nix store"

############################################################################
#
#  Darwin related commands
#
############################################################################

darwin:
	nix build .#darwinConfigurations.$(HOSTNAME).system \
		--extra-experimental-features 'nix-command flakes'
	sudo -E ./result/sw/bin/darwin-rebuild switch --flake .#$(HOSTNAME)

darwin-debug:
	nix build .#darwinConfigurations.$(HOSTNAME).system --show-trace --verbose \
		--extra-experimental-features 'nix-command flakes'
	sudo -E ./result/sw/bin/darwin-rebuild switch --flake .#$(HOSTNAME) --show-trace --verbose

############################################################################
#
#  nix related commands
#
############################################################################

# Update all the flake inputs
up:
	nix flake update

# Update specific input
# Usage: make upp INPUT=nixpkgs
upp:
	nix flake update $(INPUT)

# List all generations of the system profile
history:
	nix profile history --profile /nix/var/nix/profiles/system

# Open a nix shell with the flake
repl:
	nix repl -f flake:nixpkgs

# remove all generations older than 7 days
# on darwin, you may need to switch to root user to run this command
clean:
	sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 7d

# Garbage collect all unused nix store entries
gc:
	# garbage collect all unused nix store entries(system-wide)
	sudo nix-collect-garbage --delete-older-than 7d
	# garbage collect all unused nix store entries(for the user - home-manager)
	# https://github.com/NixOS/nix/issues/8508
	nix-collect-garbage --delete-older-than 7d

fmt:
	# format the nix files in this repo
	nix fmt

# Show all the auto gc roots in the nix store
gcroot:
	ls -al /nix/var/nix/gcroots/auto/
