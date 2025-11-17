{ config, lib, ... }:
{
  home.activation."fix-secret-permissions" = lib.hm.dag.entryAfter ["writeBoundary"] ''
    install -m 400 /run/secrets/jonasSshPrivateKey ${config.home.homeDirectory}/.ssh/id_ed25519
  '';
}
