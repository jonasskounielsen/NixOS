{
    description = "desktop config";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, home-manager, ...}:
        let
            lib = nixpkgs.lib;
            system = "x86_64-linux";
            pkgs = (import nixpkgs { inherit system; });
        in {
        nixosConfigurations = {
            jonas-desktop = lib.nixosSystem {
                system = system;
                modules = [
                    ./desktop/configuration.nix
                    home-manager.nixosModules.home-manager
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.jonas = ./home.nix;
                    }
                ];
            };
            jonas-laptop = lib.nixosSystem {
                system = system;
                modules = [
                    ./laptop/configuration.nix
                    home-manager.nixosModules.home-manager
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.jonas = ./home.nix;
                    }
                ];
            };
        };
        devShells.${system} = {
            rust = (import ./devShells/rust.nix { inherit pkgs; });
            ttt-masters = (import ./devShells/ttt-masters.nix { inherit pkgs; });
        };
    };
}
