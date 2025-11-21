{ pkgs, ... }: {
  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      corefonts
      nerd-fonts.hack
      minecraftia
      monocraft
      font-awesome
    ];
  };

  fileSystems."/usr/share/fonts" = {
    device = "/run/current-system/sw/share/X11/fonts";
    options = [ "bind" ];
  };
}
