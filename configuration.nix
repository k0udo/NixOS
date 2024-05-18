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
    ll = "ls -l";
    update = "sudo nixos-rebuild switch -I nixos-config=/home/jeff/Repos/nixos/configuration.nix";
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
      blender
      brave
      discord
      firefox-devedition
      gimp-with-plugins
      git
      github-desktop
      home-manager
      libreoffice-qt
      obsidian
      pcsx2
      spotify
      unzip
      vmware-horizon-client
      vscode
      wget
      wine
      vlc
      yakuake
    ];
  };



  environment.systemPackages = with pkgs; [
  ];

  system.stateVersion = "23.11";
}

