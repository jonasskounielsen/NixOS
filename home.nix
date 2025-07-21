{ /*config,*/ pkgs, ... }:
{
    home = {
        username = "jonas";
        homeDirectory = "/home/jonas";

        packages = with pkgs; [
            kdePackages.plasma-browser-integration
            kdePackages.kdeconnect-kde
            discord
            onedriver
            bitwarden-desktop
            onlyoffice-desktopeditors
            osu-lazer-bin
            neovim
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
                    "extensions.experimental.affinity" = {
                        "asvetliakov.vscode-neovim" = "1";
                    };
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
                    {
                        key = "ctrl+enter";
                        command = "rust-analyzer.run";
                    }
                ];
                extensions = with pkgs.vscode-extensions; [
                    usernamehw.errorlens
                    asvetliakov.vscode-neovim
                ]; # apparently home manager creates a broken extensions dir if there are no extensions
            in {
                rust = {
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
                        rust-lang.rust-analyzer
                        vadimcn.vscode-lldb
                    ]);
                };
                ttt-masters = {
                    userSettings = userSettings;
                    keybindings = keybindings;
                    extensions = extensions ++ (with pkgs.vscode-extensions; [
                        rust-lang.rust-analyzer
                        vadimcn.vscode-lldb
                    ]);
                };
            };
        };
    };
}
