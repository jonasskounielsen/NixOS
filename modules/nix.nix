{ ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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
