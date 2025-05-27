{ /*config,*/ pkgs, ... }:
{
    home = {
        username = "jonas";
        homeDirectory = "/home/jonas";

        packages = with pkgs; [
            kdePackages.plasma-browser-integration
            discord
            steam
            onedriver
            # vscode
            bitwarden-desktop
            #  thunderbird
        ];

        sessionVariables = {
            # environment variables
        };

        # like system.stateVersion but for Home Manager
        stateVersion = "24.11";
    };

    programs = {
        home-manager.enable = true;
        git = {
            enable = true;
            userName = "jonasskounielsen";
            userEmail = "jonasskou.n@gmail.com";
        };
        vscode = {
            enable = true;
            package = pkgs.vscodium;
            profiles = {
                rust = {
                    extensions = /*with pkgs.vscode-extensions;*/ [
pkgs.vscode-extensions.ziglang.vscode-zig                    ];
                    userSettings = {

                    };
                };
            };
        };
    };
}
