{ pkgs, ... }:
{
  programs.niri.enable = true;

  services.displayManager.sessionPackages = with pkgs; [
    niri
  ];
}
