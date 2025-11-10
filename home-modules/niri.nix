{ lib, ... }@inputs:
let
  niriDir = builtins.readDir ./niri;
  mapFn = name: value: import "${./niri}/${name}" inputs;
  combinedKdl = lib.concatMapAttrsStringSep "\n" mapFn niriDir;
in 
{
  xdg.configFile."niri/config.kdl".text = combinedKdl;
}
