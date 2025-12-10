{ pkgs, awww, ... }:
{
  # Daemon is started in Niri config.
  home.packages = [
    awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
  ];
}

