{ config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./modules/bundle.nix
  ];
  
  home.username = "andrestorresgo";
  home.homeDirectory = "/home/andrestorresgo";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
