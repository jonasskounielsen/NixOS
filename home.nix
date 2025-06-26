{ /*config,*/ pkgs, ... }:
{
    home = {
        username = "jonas";
        homeDirectory = "/home/jonas";

        packages = with pkgs; [
            kdePackages.plasma-browser-integration
            discord
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
            profiles =
            let
                userSettings = {
                    "editor.formatOnSave" = true;
                    "editor.formatOnSaveMode" = "modifications";
                    "git.autofetch" = true;
                    "git.confirmSync" = false;
                    "git.enableSmartCommit" = true;
                    "explorer.confirmDelete" = false;
                    "rust-analyzer.diagnostics.styleLints.enable" = true;
                    "terminal.integrated.tabs.enabled" = false;
                    "explorer.confirmDragAndDrop" = false;
                    "workbench.colorTheme" = "Monokai";
                };
                keybindings = [
                    {
                        key = "ctrl+alt+v";
                        command = "-workbench.action.editorDictation.start";
                        when = "hasSpeechProvider && !editorReadonly && !speechToTextInProgress";
                    }
                    {
                        key = "ctrl+shift+d";
                        command = "editor.action.addSelectionToPreviousFindMatch";
                    }
                    {
                        key = "ctrl+k ctrl+shift+d";
                        command = "editor.action.moveSelectionToPreviousFindMatch";
                    }
                    {
                        key = "ctrl+'";
                        command = "editor.action.commentLine";
                        when = "editorTextFocus && !editorReadonly";
                    }
                    {
                        key = "ctrl+shift+7";
                        command = "-editor.action.commentLine";
                        when = "editorTextFocus && !editorReadonly";
                    }
                    {
                        key = "ctrl+shift+a";
                        command = "-editor.action.blockComment";
                        when = "editorTextFocus && !editorReadonly";
                    }
                    {
                        key = "ctrl+shift+'";
                        command = "editor.action.blockComment";
                    }
                    {
                        key = "ctrl+alt+s";
                        command = "workbench.action.files.saveFiles";
                    }
                ];
                extensions = with pkgs.vscode-extensions; [
                    usernamehw.errorlens
                ];
            in {
                rust = { # apparently home manager creates a broken extensions dir if there are no extensions
                    userSettings = userSettings;
                    keybindings = keybindings;
                    extensions = extensions ++ (with pkgs.vscode-extensions; [
                        rust-lang.rust-analyzer
                        vadimcn.vscode-lldb
                    ]);
                };
                esp8266 = {
                    userSettings = userSettings;
                    keybindings = keybindings;
                    extensions = extensions ++ (with pkgs.vscode-extensions; [
                        platformio.platformio-vscode-ide
                    ]);
                };
            };
        };
    };
}
