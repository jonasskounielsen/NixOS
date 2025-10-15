{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-20075955.url = "nixpkgs/20075955deac2583bb12f07151c2df830ef346b4";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    sops-nix.url = "github:Mic92/sops-nix";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-20075955,
      home-manager,
      sops-nix,
      nix-vscode-extensions,
      ...
    }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = (import nixpkgs { inherit system; });
      pkgs-20075955 = (import nixpkgs-20075955 { inherit system; });
      sharedModules = [
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
          specialArgs = {
            inherit pkgs-20075955;
          };
        };
        jonas-laptop = lib.nixosSystem {
          inherit system;
          modules = sharedModules ++ [
            ./laptop/configuration.nix
          ];
          specialArgs = {
            inherit pkgs-20075955;
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
            value = import "${./devShells}/${fileName}" { inherit pkgs; };
          }
        ) (builtins.attrNames (builtins.readDir ./devShells))
      );

      packages.${system}.minesweeper = import ./packages/minesweeper.nix { inherit pkgs; };
    };
}
