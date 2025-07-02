{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # enableAutosuggestions = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases =
      let
        flakeDir = "~/.dotfiles";
        hyprlandDir = "~/.config/hypr";
      in {
      rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
      upd = "nix flake update --flake ${flakeDir}";
      upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";

      hms = "home-manager switch --flake ${flakeDir}";

      conf = "code ${flakeDir}/nixos/configuration.nix";
      pkgs = "code ${flakeDir}/nixos/packages.nix";
      dotfiles = "code ${flakeDir}";
      hyprdots = "code ${hyprlandDir}";

      ll = "ls -l";
      ff = "fastfetch";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    # Add thefuck initialization
    initExtra = ''
      eval $(thefuck --alias)
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      theme = "agnoster"; # blinks is also really nice
    };
  };
}