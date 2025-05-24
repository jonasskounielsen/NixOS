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
        in {
        nixosConfigurations = {
            jonas-nixos-desktop = lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./configuration.nix
                    home-manager.nixosModules.home-manager
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.jonas = ./home.nix;
                    }
                ];
            };
        };
    };
}
