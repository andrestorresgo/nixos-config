{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [
    # Desktop apps
    chromium
    firefox
    discord
    gparted
    obsidian
    spotify
    beeper

    # Coding stuff
    nodejs
    docker
    #python3
    # cachix
    # beekeeper-studio

    # CLI utils
    neofetch
    file
    tree
    wget
    git
    fastfetch
    htop
    btop
    nix-index
    unzip
    # scrot
    ffmpeg
    # light
    lux
    # mediainfo
    # ranger
    # zram-generator
    cava
    zip
    # ntfs3g
    # yt-dlp
    # brightnessctl
    # swww
    # openssl
    # lazygit
    # bluez
    # bluez-tools
    #cbonsai
    fzf
    yazi
    jq
    appimage-run
    fuse
    termusic
    thefuck

    # GUI utils
    feh
    hyprpicker
    # imv
    # dmenu
    # screenkey
    # mako
    # gromit-mpx

    # Xorg stuff
    #xterm
    #xclip
    #xorg.xbacklight

    # Wayland stuff
    # xwayland
    wl-clipboard
    cliphist
    wl-clip-persist

    #Graphics stuff
    libGL
    libGLU
    mesa
    wayland-protocols

    # WMs and stuff
    hyprpaper
    # herbstluftwm
    # hyprland
    # seatd
    # xdg-desktop-portal-hyprland
    # polybar
    # waybar

    # Sound
    pipewire
    pulseaudio
    pamixer
    playerctl

    # Screenshotting
    grimblast
    slurp
    hyprshot
    # swappy

    #Bluetooth
    overskride

    # Networking
    zerotierone

    # Other
    # home-manager
    # spice-vdagent
    # libsForQt5.qtstyleplugin-kvantum
    # libsForQt5.qt5ct
    # papirus-nord
    rose-pine-icon-theme
    rose-pine-cursor
    libayatana-appindicator
  ];
}