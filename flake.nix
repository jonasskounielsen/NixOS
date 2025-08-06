{
    description = "desktop config";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        nix-ld.url = "github:Mic92/nix-ld/2.0.4";
        # rust compile error when specifying v2.0.3 or not specifying version
        nix-ld.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, home-manager, nix-ld, ...}:
        let
            lib = nixpkgs.lib;
            system = "x86_64-linux";
            pkgs = (import nixpkgs { inherit system; });
            sharedModules = [
                home-manager.nixosModules.home-manager
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.jonas = ./home.nix;
                }
                nix-ld.nixosModules.nix-ld
                {
                    programs.nix-ld.dev.enable = true;
                    programs.nix-ld.libraries = with pkgs; [
                        stdenv.cc.cc
                    ];
                }
            ];
        in {
        nixosConfigurations = {
            jonas-desktop = lib.nixosSystem {
                inherit system;
                modules = sharedModules ++ [
                    ./desktop/configuration.nix
                ];
            };
            jonas-laptop = lib.nixosSystem {
                inherit system;
                modules = sharedModules ++ [
                    ./laptop/configuration.nix
                ];
            };
        };
        devShells.${system} = {
            rust = (import ./devShells/rust.nix { inherit pkgs; });
            ttt-masters = (import ./devShells/ttt-masters.nix { inherit pkgs; });
            esp8266-lua = (import ./devShells/esp8266-lua.nix { inherit pkgs; });
            vulkano = (import ./devShells/vulkano.nix { inherit pkgs; });
        };
    };
}
