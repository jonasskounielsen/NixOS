{ ... }:
{
  programs.waybar = {
    #enable = true;
    style = builtins.readFile ./waybar/style.css;
    settings = {
      layer = "top";
      
    };
    systemd = {
      enable = true;
      target = "niri.service";
    };
  };
}