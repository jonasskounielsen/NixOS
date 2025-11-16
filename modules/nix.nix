{ ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  nix.registry.system = {
    from = {
      type = "indirect";
      id = "system";
    };
    to = {
      type = "path";
      path = "/home/jonas/NixOS";
    };
  };
}
