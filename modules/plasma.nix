{ pkgs, ... }:
{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sessionPackages = with pkgs; [
    kdePackages.plasma-workspace
  ];
}
