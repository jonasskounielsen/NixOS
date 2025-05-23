{
    description = "desktop config";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs, ...}:
        let
            lib = nixpkgs.lib;
        in {
        nixosConfigurations = {
            jonas-nixos-desktop = lib.nixosSystem {
                system = "x86_64-linux";
                modules = [ ./configuration.nix ];
            };
        };
    };
}
