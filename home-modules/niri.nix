{ pkgs, lib, ... }:
let
  brightnessctlScript = middle: ''"""
    if [ -z $BRIGHTNESSCTL_BRIGHTNESS ]; then
      BRIGHTNESSCTL_BRIGHTNESS=5
    fi
    ${middle}
    values=("1%" "1.5%" "2.5%" "4%" "6%" "10%" "15%" "25%" "40%" "60%" "100%")
    value="$\{values[$BRIGHTNESSCTL_BRIGHTNESS]}"
    brightnessctl set --class=backlight "$value"
  """'';
  variables = {
    "$XWAYLAND_SATELLITE_PATH" = "${pkgs.xwayland-satellite}/bin/xwayland-satellite";
    "$BRIGHTNESSCTL_INCREASE" = brightnessctlScript ''
      BRIGHTNESSCTL_BRIGHTNESS=(($BRIGHTNESSCTL_BRIGHTNESS+1))
      if [ "$BRIGHTNESSCTL_BRIGHTNESS" -gt 10 ]; then
        BRIGHTNESSCTL_BRIGHTNESS=10
      fi
    '';
    "$BRIGHTNESSCTL_DECREASE" = brightnessctlScript ''
      BRIGHTNESSCTL_BRIGHTNESS=(($BRIGHTNESSCTL_BRIGHTNESS-1))
      if [ "$BRIGHTNESSCTL_BRIGHTNESS" -lt 0 ]; then
        BRIGHTNESSCTL_BRIGHTNESS=0
      fi
    '';
  };
  niriDir = builtins.readDir ./niri;
  mapFn = name: value: builtins.readFile "${./niri}/${name}";
  combinedKdl = lib.concatMapAttrsStringSep "\n" mapFn niriDir;
  patchedKdl = builtins.replaceStrings (builtins.attrNames variables) (builtins.attrValues variables) combinedKdl;
in 
{
  xdg.configFile."niri/config.kdl".text = patchedKdl;
}
