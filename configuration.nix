{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Define your hostname.
  networking.hostName = "onix"; 
  # Enable networking
  networking.networkmanager.enable = true;
  # Enable Bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot  
  # Enable Thunderbolt
  # services.hardware.bolt.enable = true;  

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";
  # Select internationalisation properties.
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

  # Enable the X11 windowing system and Configure keymap in X11 
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
  };
  # SDDM Greeter
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  # Enable the KDE Plasma Desktop Environment.
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
  plasma-browser-integration
  elisa
  kate
  oxygen
];


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Nerd Fonts
  fonts.packages = with pkgs; [ (nerdfonts.override {fonts=["FiraCode"];})];

  # ZSH
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
      yakuake
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
    environment.systemPackages = with pkgs; [

  ];

  system.stateVersion = "23.11";

}