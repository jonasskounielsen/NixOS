{ noctalia, lib, inputs, ... }:
{
  imports = [
    noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    settings = lib.importTOML ./noctalia/config.toml;
  };
}
