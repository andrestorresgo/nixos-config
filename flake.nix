{
  description = "Bare Metal Flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    
    # Hyprpaper input
    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # Rose Pine theme inputs
    waybar-rose-pine = {
      url = "github:rose-pine/waybar";
      flake = false;
    };
    rose-pine-rofi = {
      url = "github:heisfer/rose-pine-rofi";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, hyprpaper, waybar-rose-pine, rose-pine-rofi, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [ 
          ./nixos/configuration.nix
          nixos-hardware.nixosModules.lenovo-legion-15arh05h
        ];
      };
    };

    homeConfigurations = {
      andrestorresgo = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
          ./home/home.nix
          {
            # Pass inputs to Home Manager modules
            _module.args = {
              inherit (self) inputs;
            };
          }
        ];
      };
    };
  };
}