{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./packages.nix
      ./services/zerotierone.nix
      # ./gaming.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # I use zsh btw
  environment.shells = with pkgs; [zsh];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/La_Paz";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" "es_BO.UTF-8/UTF-8" ];

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_BO.UTF-8";
    LC_IDENTIFICATION = "es_BO.UTF-8";
    LC_MEASUREMENT = "es_BO.UTF-8";
    LC_MONETARY = "es_BO.UTF-8";
    LC_NAME = "es_BO.UTF-8";
    LC_NUMERIC = "es_BO.UTF-8";
    LC_PAPER = "es_BO.UTF-8";
    LC_TELEPHONE = "es_BO.UTF-8";
    LC_TIME = "es_BO.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,latam"; # Both US and Latin American layouts
    variant = "";
    options = "grp:win_space_toggle"; # Change this line to Super+Spacebar
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable automounting disks on demand
  services = {
    udisks2.enable = true;
    gvfs.enable = true;
    devmon.enable = true;
    dbus.enable = true;
  };

  # Enable D-Bus socket activation
  systemd.services.dbus = {
    enable = true;
    wantedBy = [ "multi-user.target" ];
};

# Enable polkit
security.polkit.enable = true;

# Create a polkit rule to allow mounting without password
security.polkit.extraConfig = ''
  polkit.addRule(function(action, subject) {
    var YES = polkit.Result.YES;
    var permission = {
      "org.freedesktop.udisks2.filesystem-mount": YES,
      "org.freedesktop.udisks2.filesystem-mount-system": YES,
      "org.freedesktop.udisks2.filesystem-mount-other-seat": YES,
      "org.freedesktop.udisks2.filesystem-unmount-others": YES,
      "org.freedesktop.udisks2.eject-media": YES,
      "org.freedesktop.udisks2.power-off-drive": YES
    };
    if (subject.isInGroup("users") || subject.isInGroup("wheel")) {
      return permission[action.id];
    }
  });
'';

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  users.groups = {
  plugdev = {};
  storage = {};
};

  # Define a user account. Don't forget to set a password with 'passwd'.
  users.users.andrestorresgo = {
    isNormalUser = true;
    description = "andrestorresgo";
    extraGroups = [ "networkmanager" "wheel" "plugdev" "storage" "disk" "systemd-journal" "users" "adbusers" "docker" ];
    packages = with pkgs; [
      kitty
    ];
  };

  # hyprland stuff
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    # WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
  
  hardware = {
    graphics.enable = true;

    nvidia.modesetting.enable = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    vscode
    pciutils
    tree

    # hyprland utils
    waybar
    dunst
    libnotify
    swww
    rofi-wayland

    #Disk troubleshooting
    gnome-disk-utility
    ntfs3g
    udisks
    usbutils
  ];

  # Install adb
  programs.adb.enable = true;

  system.userActivationScripts = {
    stdio = {
      text = ''
        rm -f ~/Android/Sdk/platform-tools/adb
        ln -s /run/current-system/sw/bin/adb ~/Android/Sdk/platform-tools/adb
      '';
      deps = [
      ];
    };
  };

  virtualisation.docker.enable = true;

  services.flatpak.enable = true;

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];

  system.stateVersion = "24.11"; # Did you read the comment?
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
