{ config, pkgs, inputs, ... }:

{
  imports = [
    ./wayland/bundle.nix
    ./programs/bundle.nix
    ./modules/bundle.nix
    ./zsh.nix
  ];

  home.username = "andrestorresgo";
  home.homeDirectory = "/home/andrestorresgo";

  home.stateVersion = "24.11";

  home.packages = [ 
    pkgs.rose-pine-cursor
  ];

  home.file = {

  };

  home.pointerCursor = {
    name = "BreezeX-RosePine-Linux";  # This is the actual theme name from the package
    package = pkgs.rose-pine-cursor;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  home.sessionVariables = {
    BROWSER = "firefox";
    TERMINAL = "kitty";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
