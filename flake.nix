{

  description = "Declarative Systems are pretty cool!";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    nvf.url = "github:notashelf/nvf";
    nixvim.url = "github:nix-community/nixvim/nixos-26.05";
    qylock.url = "github:Darkkal44/qylock";
  };

  outputs = { self, nixpkgs, home-manager, nvf, nixvim, qylock,  ... }:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {  
    nixosConfigurations = {
      nixos-desktop = lib.nixosSystem {
        inherit system;
        modules = [ 
          ./hosts/desktop/configuration.nix 
          qylock.nixosModules.default
        ];
      };

      nixos-laptop = lib.nixosSystem {
        inherit system;
        modules = [ 
          ./hosts/laptop/configuration.nix
          qylock.nixosModules.default
        ];
      };
    };
    
    homeConfigurations = {
      "wicker@nixos-desktop" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
          ./hosts/desktop/home.nix
          nvf.homeManagerModules.default
          nixvim.homeModules.nixvim
        ];
      };

      "wicker@nixos-laptop" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
          ./hosts/laptop/home.nix
          nvf.homeManagerModules.default
          nixvim.homeModules.nixvim
        ];
      };
    }; 
  };
}
