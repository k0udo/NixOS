# config.nix

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Define your hostname.
  networking.hostName = "onix"; 

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable Bluetooth
  # hardware.bluetooth.enable = true; # enables support for Bluetooth
  # hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot  

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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # SDDM Greeter
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  
  # Enable the KDE Plasma Desktop Environment.
  services.desktopManager.plasma6.enable = true;
  
  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

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

  # nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.jeff = {
    isNormalUser = true;
    description = "jeff";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox-devedition
      vscodium
      git
      bitwarden
      obsidian
      spotify
      libreoffice-qt
      wget
      unzip
      discord
    ];
  };

  nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
  ];

  system.stateVersion = "23.11";
}
