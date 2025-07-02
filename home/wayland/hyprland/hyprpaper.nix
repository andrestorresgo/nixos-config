{ inputs, pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    package = inputs.hyprpaper.packages.${pkgs.system}.default;
    settings = {
      splash = false;
      preload = [ "/home/andrestorresgo/.dotfiles/stuff/wallpapers/moon.jpg" ];
      wallpaper = [ ", /home/andrestorresgo/.dotfiles/stuff/wallpapers/moon.jpg" ];
    };
  };
}