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
                rust = {
                    extensions = with pkgs.vscode-extensions; [
                        rust-lang.rust-analyzer # apparently home manager creates a broken extensions dir if there are no extensions
                    ];
                    userSettings = {

                    };
                };
            };
        };
    };
}
