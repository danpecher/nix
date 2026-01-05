{ pkgs, ... }:

  ###################################################################################
  #
  #  macOS's System configuration
  #
  #  All the configuration options are documented here:
  #    https://daiderd.com/nix-darwin/manual/index.html#sec-options
  #  Incomplete list of macOS `defaults` commands :
  #    https://github.com/yannbertrand/macos-defaults
  #
  ###################################################################################
{
  # Add ability to used TouchID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;

  # Set your time zone.
  time.timeZone = "Europe/Prague";

  system = {
    stateVersion = 6;

    defaults = {
      menuExtraClock = {
        Show24Hour = true;
        ShowDate = 1;
        ShowDayOfWeek = true;
        ShowSeconds = false;
      };
      
      # customize dock
      dock = {
        minimize-to-application = true;
        show-process-indicators = true;
        launchanim = false;
        expose-animation-duration = 0.1;
        mru-spaces = false;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.3;
        autohide = true;
        show-recents = false;

        persistent-apps = [
          "/Users/dan/Applications/Home\ Manager\ Apps/Ghostty.app"
          "/Users/dan/Applications/Home\ Manager\ Apps/Notion.app"
          "/System/Cryptexes/App/System/Applications/Safari.app"
          "/Users/dan/Applications/Home\ Manager\ Apps/VSCodium.app"
        ];
        persistent-others = [
          "/Users/dan/Downloads"
          "/Users/dan/Desktop"
        ];
      };

      # customize finder
      finder = {
        _FXShowPosixPathInTitle = true;  # show full path in finder title
        AppleShowAllExtensions = true;  # show all file extensions
        FXEnableExtensionChangeWarning = false;  # disable warning when changing file extension
        QuitMenuItem = true;  # enable quit menu item
        ShowPathbar = true;  # show path bar
        ShowStatusBar = true;  # show status bar
        FXPreferredViewStyle = "clmv";      # Column view
      };

      # customize trackpad
      trackpad = {
        Clicking = true;  # enable tap to click
        TrackpadRightClick = true;  # enable two finger right click
        TrackpadThreeFingerDrag = true;  # enable three finger drag
        ActuationStrength = 0;  # light haptic feedback
        FirstClickThreshold = 0;  # light click pressure
      };

      # customize settings that not supported by nix-darwin directly
      # Incomplete list of macOS `defaults` commands :
      #   https://github.com/yannbertrand/macos-defaults
      NSGlobalDomain = {
        # `defaults read NSGlobalDomain "xxx"`
        "com.apple.swipescrolldirection" = true;  # enable natural scrolling(default to true)
        "com.apple.sound.beep.feedback" = 0;  # disable beep sound when pressing volume up/down key
        AppleInterfaceStyle = "Dark";  # dark mode
        AppleKeyboardUIMode = 3;  # Mode 3 enables full keyboard control.
        ApplePressAndHoldEnabled = true;  # enable press and hold

        # If you press and hold certain keyboard keys when in a text area, the key’s character begins to repeat.
        # This is very useful for vim users, they use `hjkl` to move cursor.
        # sets how long it takes before it starts repeating.
        InitialKeyRepeat = 15;  # normal minimum is 15 (225 ms), maximum is 120 (1800 ms)
        # sets how fast it repeats once it starts. 
        KeyRepeat = 3;  # normal minimum is 2 (30 ms), maximum is 120 (1800 ms)

        NSAutomaticCapitalizationEnabled = false;  # disable auto capitalization
        NSAutomaticDashSubstitutionEnabled = false;  # disable auto dash substitution
        NSAutomaticPeriodSubstitutionEnabled = false;  # disable auto period substitution
        NSAutomaticQuoteSubstitutionEnabled = false;  # disable auto quote substitution
        NSAutomaticSpellingCorrectionEnabled = false;  # disable auto spelling correction
        NSNavPanelExpandedStateForSaveMode = true;  # expand save panel by default
        NSNavPanelExpandedStateForSaveMode2 = true;
      };

      # Customize settings that not supported by nix-darwin directly
      # see the source code of this project to get more undocumented options:
      #    https://github.com/rgcr/m-cli
      # 
      # All custom entries can be found by running `defaults read` command.
      # or `defaults read xxx` to read a specific domain.
      CustomUserPreferences = {
        ".GlobalPreferences" = {
          # automatically switch to a new space when switching to the application
          AppleSpacesSwitchOnActivate = true;
        };
        # Disable Spotlight shortcuts (to use ⌘+Space for Raycast)
        "com.apple.symbolichotkeys" = {
          AppleSymbolicHotKeys = {
            "64" = { enabled = false; };  # Spotlight Search
            "65" = { enabled = false; };  # Spotlight Window
          };
        };
        NSGlobalDomain = {
          # Add a context menu item for showing the Web Inspector in web views
          WebKitDeveloperExtras = true;
        };
        "com.apple.finder" = {
          ShowExternalHardDrivesOnDesktop = true;
          ShowHardDrivesOnDesktop = true;
          ShowMountedServersOnDesktop = true;
          ShowRemovableMediaOnDesktop = true;
          _FXSortFoldersFirst = true;
          # When performing a search, search the current folder by default
          FXDefaultSearchScope = "SCcf";
        };
        "com.apple.desktopservices" = {
          # Avoid creating .DS_Store files on network or USB volumes
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
        "com.apple.spaces" = {
          "spans-displays" = 0; # Display have seperate spaces
        };
        "com.apple.WindowManager" = {
          EnableStandardClickToShowDesktop = 1; # Click wallpaper to reveal desktop
          StandardHideDesktopIcons = 0; # Show items on desktop
          HideDesktop = 0; # Do not hide items on desktop & stage manager
          StageManagerHideWidgets = 0;
          StandardHideWidgets = 0;
        };
        "com.apple.screensaver" = {
          # Require password immediately after sleep or screen saver begins
          askForPassword = 1;
          askForPasswordDelay = 0;
        };
        "com.apple.screencapture" = {
          location = "~/Desktop";
          type = "png";
        };
        "com.apple.AdLib" = {
          allowApplePersonalizedAdvertising = false;
        };
        # Prevent Photos from opening automatically when devices are plugged in
        "com.apple.ImageCapture".disableHotPlug = true;

        "com.apple.LaunchServices" = {
          LSQuarantine = false;
        };
        # Safari settings
        "com.apple.Safari" = {
          AlwaysRestoreSessionAtLaunch = true;  # Resume previous session
          ExcludePrivateWindowWhenRestoringSessionAtLaunch = true;
          ShowOverlayStatusBar = true;
          WebKitDeveloperExtrasEnabledPreferenceKey = true;  # Enable developer tools
          "WebKitPreferences.developerExtrasEnabled" = true;
          IncludeDevelopMenu = true;
          AutoFillPasswords = false;
          AutoFillCreditCardData = false;
          WebAutomaticSpellingCorrectionEnabled = false;  # Disable autocorrect
        };
      };

      loginwindow = {
        GuestEnabled = false;  # disable guest user
        SHOWFULLNAME = true;  # show full name in login window
      };

      controlcenter = {
        BatteryShowPercentage = true;
        Bluetooth = true;
        Sound = true;
        AirDrop = false;
        Display = false;
        FocusModes = false;
        NowPlaying = false;
      };

      SoftwareUpdate = {
        AutomaticallyInstallMacOSUpdates = true;
      };
    };
  };

  # Create /etc/zshrc that loads the nix-darwin environment.
  # this is required if you want to use darwin's default shell - zsh
  programs.zsh.enable = true;
  environment.shells = [
    pkgs.zsh
  ];

  # Fonts
  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-design-icons
      font-awesome

      # nerdfonts
      # https://github.com/NixOS/nixpkgs/blob/nixos-unstable-small/pkgs/data/fonts/nerd-fonts/manifests/fonts.json
      nerd-fonts.symbols-only # symbols icon only
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
    ];
  };

}
