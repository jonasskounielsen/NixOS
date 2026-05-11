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
}
