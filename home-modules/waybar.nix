{ pkgs, ... }:
{
  # Waybar configuration from https://github.com/JamesPness/NixOS
  programs.waybar = {
    enable = false;
    settings = import ./waybar/settings.nix;
    style = ./waybar/style.css;
  };
}
