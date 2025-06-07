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
            bitwarden-desktop
            onlyoffice-desktopeditors
            osu-lazer-bin
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
        vscode = {
            enable = true;
            package = pkgs.vscodium;
            profiles = {
                rust = { # apparently home manager creates a broken extensions dir if there are no extensions
                    extensions = with pkgs.vscode-extensions; [
                        rust-lang.rust-analyzer
                        vadimcn.vscode-lldb
                        usernamehw.errorlens
                    ];
                    userSettings = {

                    };
                };
            };
        };
    };
}
