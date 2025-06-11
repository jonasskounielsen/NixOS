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
                        "workbench.colorTheme" = "monokai";
                        "editor.formatOnSave" = true;
                        "editor.formatOnSaveMode" = "modifications";
                        "git.autofetch" = true;
                        "git.confirmSync" = false;
                        "git.enableSmartCommit" = true;
                        "explorer.confirmDelete" = false;
                        "rust-analyzer.diagnostics.styleLints.enable" = true;
                        "terminal.integrated.tabs.enabled" = false;
                        "explorer.confirmDragAndDrop" = false;
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
                };
            };
        };
    };
}
