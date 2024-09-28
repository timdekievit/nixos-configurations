
{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/nvidia-980.nix
      # ../../modules/awesome-wm.nix
      ../../modules/gaming.nix
      # ../../modules/libinput.nix
      # ../../modules/sound.nix
      # ../../modules/polkit.nix
      ../../modules/file-manager.nix
      # ../../modules/stylix.nix
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

  # fonts.packages = with pkgs; [
  #   noto-fonts
  #   noto-fonts-cjk
  #   noto-fonts-emoji
  #   liberation_ttf
  #   fira-code
  #   fira-code-symbols
  #   mplus-outline-fonts.githubRelease
  #   dina-font
  #   proggyfonts
  #   terminus_font
  # ];

  # rtkit is optional but recommended
  security.rtkit.enable = true;

  # neccesary for nemo network to work
  services.gvfs.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # environment.plasma6.excludePackages = with pkgs.kdePackages; [
  #   plasma-browser-integration
  #   konsole
  #   oxygen
  # ];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
