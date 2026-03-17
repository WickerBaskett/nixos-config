{

  description = "One flake to rule them all";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {  
    nixosConfigurations = {
      nixos-desktop = lib.nixosSystem {
        inherit system;
        modules = [ ./hosts/desktop/configuration.nix ];
      };

      nixos-laptop = lib.nixosSystem {
        inherit system;
        modules = [ ./hosts/laptop/configuration.nix ];
      };
    };
    
    homeConfigurations = {
      "wicker@nixos-desktop" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/desktop/home.nix ];
      };

      "wicker@nixos-laptop" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/laptop/home.nix ];
      };
    }; 
  };
}
