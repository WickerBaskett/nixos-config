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
      nixos = lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
      };
    };
    
    homeConfigurations = {
      wicker = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
      };
    }; 
  };
}
