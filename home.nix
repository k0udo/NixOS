{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jeff";
  home.stateVersion = "23.11";
  
  # Define a user account.
  # isNormalUser = true;
  # shell = pkgs.zsh;
  # extraGroups = [ "networkmanager" "wheel" ];
  # The home.packages option allows you to install Nix packages into your
  # environment.


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
    wget
    unzip
    colorls
  ];
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    # userName = "K0udo";
    # userEmail = "noreply@gamenthings.net";
  };
}
