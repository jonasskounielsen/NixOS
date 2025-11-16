{ pkgs, ... }:
{
  virtualisation.docker.enable = true; # For Winboat.
  
  environment.systemPackages = with pkgs; [
    winboat
  ];
}
