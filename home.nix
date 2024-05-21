{ config, pkgs, ... }:

{
  home.username = "jeff";
  home.stateVersion = "23.11";
  
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  home.packages = with pkgs;[
    bitwarden
    brave
    discord
    firefox-devedition
    github-desktop
    libreoffice-qt
    obsidian
    spotify
    vlc
    vmware-horizon-client
    vscode
    yakuake
    
    # Gaming
    pcsx2
    steam

    # Security Tools
    nmap
    wireshark
    burpsuite
    gobuster
    exploitdb
    caido

  ];
  programs.home-manager.enable = true;

  programs.librewolf = {
    enable = true;
    # Enable WebGL, cookies and history
    settings = {
      "webgl.disabled" = false;
      "privacy.resistFingerprinting" = false;
      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "network.cookie.lifetimePolicy" = 0;
      "identity.fxaccounts.enabled" = true;
    };
  };

  # TODO - Add own global configs
  programs.git = {
    enable = true;
    # userName = "K0udo";
    # userEmail = "noreply@gamenthings.net";
  };
}
