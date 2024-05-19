{ config, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      <home-manager/nixos>
    ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "onix"; 
    networkmanager.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  }; 

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  time.timeZone = "America/Los_Angeles";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
  };
  
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    elisa
    kate
    oxygen
    ];

  services.printing.enable = true;
  
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  fonts.packages = with pkgs; [ (nerdfonts.override {fonts=["FiraCode" "DroidSansMono"];})];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    zsh-autoenv.enable = true;
    syntaxHighlighting.enable = true;
    enableLsColors = true;
    ohMyZsh = {
      enable = true;
      theme = "agnoster";
      plugins = [ "git" "history-substring-search" ];
    };
    shellAliases = {
      ls = "colorls";
      ll = "ls -l";
      flake-rebuild = "sudo nixos-rebuild switch --flake '/home/jeff/Repos/nixos#onix' --impure";
      flake-update = "nix flake update";
    };   
  };

  # Define a user account.
  users.users.jeff = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "jeff";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      bitwarden
      brave
      colorls
      discord
      firefox-devedition
      git
      github-desktop
      libreoffice-qt
      obsidian
      pcsx2
      spotify
      unzip
      vmware-horizon-client
      vscode
      wget
      vlc
      yakuake
    ];
  };



  environment.systemPackages = with pkgs; [
  ];

  system.stateVersion = "23.11";
}

