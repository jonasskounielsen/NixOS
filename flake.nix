{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-20075955.url = "nixpkgs/20075955deac2583bb12f07151c2df830ef346b4";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    sops-nix.url = "github:Mic92/sops-nix";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nvf.url = "github:notashelf/nvf";
  };

  outputs =
    inputs@{
      nixpkgs,
      nixpkgs-20075955,
      home-manager,
      sops-nix,
      nvf,
      ...
    }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = (import nixpkgs { inherit system; });
      pkgs-20075955 = (import nixpkgs-20075955 { inherit system; });
      sharedModules = [
        ./configuration.nix
        nvf.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.jonas = ./home.nix;
            extraSpecialArgs = inputs;
          };
        }
        sops-nix.nixosModules.sops
      ];
    in
    {
      nixosConfigurations = {
        jonas-desktop = lib.nixosSystem {
          inherit system;
          modules = sharedModules ++ [
            ./desktop/configuration.nix
          ];
          specialArgs = inputs // {
            inherit pkgs-20075955;
            host = "desktop";
          };
        };
        jonas-laptop = lib.nixosSystem {
          inherit system;
          modules = sharedModules ++ [
            ./laptop/configuration.nix
          ];
          specialArgs = inputs // {
            inherit pkgs-20075955;
            host = "laptop";
          };
        };
      };
      
      devShells.${system} = builtins.listToAttrs (
        map (
          fileName:
          let
            nameLen = (builtins.stringLength fileName) - 4;
            name = builtins.substring 0 nameLen fileName;
          in
          {
            inherit name;
            value = import "${./dev-shells}/${fileName}" { inherit pkgs; };
          }
        ) (builtins.attrNames (builtins.readDir ./dev-shells))
      );

      packages.${system} = {
        minesweeper = import ./packages/minesweeper.nix { inherit pkgs; };
      };
    };
}
