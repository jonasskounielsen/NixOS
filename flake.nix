{
    description = "nixos config";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        sops-nix.url =  "github:Mic92/sops-nix";
    };

    outputs = { self, nixpkgs, home-manager, sops-nix, ...}:
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
                sops-nix.nixosModules.sops
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
        devShells.${system} = builtins.listToAttrs (
            map (
                fileName: let
                    nameLen = (builtins.stringLength fileName) - 4;
                    name = builtins.substring 0 nameLen fileName;
                in
                    {
                        inherit name;
                        value = import "${./devShells}/${fileName}" { inherit pkgs; };
                    }
            ) (builtins.attrNames (builtins.readDir ./devShells))
        );
    };
}
