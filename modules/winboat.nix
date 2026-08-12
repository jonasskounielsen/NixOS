{ pkgs, ... }:
{
  virtualisation.docker.enable = true;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-40.10.5"
  ];
  
  environment.systemPackages = with pkgs; [
    winboat
  ];
}
