{ pkgs, ... }:
{
  imports = map
    (module: "${./homeModules}/${module}")
    (builtins.attrNames (builtins.readDir ./homeModules));

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
      neovim
      processing
      prismlauncher
      signal-desktop
      zotero
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
