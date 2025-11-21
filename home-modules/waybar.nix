{ pkgs, ... }:
{
  # Waybar configuration from https://github.com/JamesPness/NixOS/commit/eeb0308d13a90867950e54871b355e22fc3b0fbc
  programs.waybar = {
    enable = true;
    settings = import ./waybar/settings.nix;
    style = ./waybar/style.css;
  };
}
