
{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/nvidia-980.nix
      ../../modules/gaming.nix
      ../../modules/sound.nix
      ../../modules/file-manager.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  fileSystems."/media/Laptop_HDD" =
    { device = "/dev/disk/by-uuid/1228BD2E28BD11A9";
      fsType = "ntfs-3g"; 
      options = [ "rw" "uid=1000"];
    };

  fileSystems."/media/TB_drive" =
    { device = "/dev/disk/by-uuid/0252E18F1516681C"; 
      fsType = "ntfs-3g"; 
      options = [ "rw" "uid=1000"];
    };

  fileSystems."/media/Windows_C" =
    { device = "/dev/disk/by-uuid/C872904E7290435C";
      fsType = "ntfs-3g"; 
      options = [ "rw" "uid=1000"];
    };  

  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.enable = false;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tim = {
    isNormalUser = true;
    description = "tim";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;  

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    wget
    neofetch
    kitty
    git
    gh
    p7zip
    unzip
    unrar
    zip
    tldr
    btop
    lshw
    gparted
    arandr
  ];

  # rtkit is optional but recommended
  security.rtkit.enable = true;

  # neccesary for nemo network to work
  services.gvfs.enable = true;

  services.openssh.enable = true;

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    oxygen
  ];

  system.stateVersion = "24.05"; # Did you read the comment?
}
