{ nix-index-database, pkgs, ... }:
{
  programs.nix-index.package = nix-index-database.packages.${pkgs.stdenv.hostPlatform.system}.nix-index-with-small-db;
  programs.nix-index-database.comma.enable = true;
}
