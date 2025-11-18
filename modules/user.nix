{ ... }:
{
  users.users.jonas = {
    isNormalUser = true;
    description = "Jonas Skou Nielsen";
    extraGroups = [ "wheel" "networkmanager" "dialout" "docker" ];
    packages = [ /* in home.nix */ ];
  };
}
