{ pkgs, lib, ... }@inputs:
let
  niriDir = builtins.attrNames (builtins.readDir ./niri);
  filterFn = item: (builtins.readDir ./niri).${item} == "regular";
  kdlFiles = builtins.filter filterFn niriDir;
  mapFn = name: import "${./niri}/${name}" inputs;
  combinedKdl = lib.concatMapStringsSep "\n" mapFn kdlFiles;
in 
{
  xdg.configFile."niri/config.kdl".text = combinedKdl;
}
