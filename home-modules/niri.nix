{ lib, ... }:
{
  xdg.configFile."niri/config.kdl".text = lib.concatMapAttrsStringSep
    "\n\n"
    (name: value: builtins.readFile "${./niri}/${name}")
    (builtins.readDir ./niri);
}