{ pkgs, self, ... }:
{
  imports = map
    (module: "${./home-modules}/${module}")
    (builtins.filter (
      item: (builtins.readDir ./home-modules).${item} == "regular"
    ) (builtins.attrNames (builtins.readDir ./home-modules)));

  home = {
    username = "jonas";
    homeDirectory = "/home/jonas";

    packages = with pkgs; [
      kdePackages.plasma-browser-integration
      kdePackages.kdeconnect-kde
      discord
      bitwarden-desktop
      onlyoffice-desktopeditors
      osu-lazer-bin
      processing
      prismlauncher
      signal-desktop
      zotero
      self.packages.${system}.minesweeper
      #  thunderbird
    ];

    sessionVariables = {
      # environment variables
    };

    # like system.stateVersion but for home manager
    stateVersion = "24.11";
  };

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "jonasskounielsen";
      userEmail = "jonasskou.n@gmail.com";
    };
  };
}
