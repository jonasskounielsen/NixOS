{ pkgs, ... }:
{
  # Waybar configuration from https://github.com/JamesPness/NixOS
  programs.waybar = {
    enable = true;
    settings = import ./waybar/settings.nix;
    style = ./waybar/style.css;
  };
}
