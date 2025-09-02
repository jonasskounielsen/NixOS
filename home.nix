{ /*config,*/ pkgs, ... }:
{
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
                        key = "ctrl+shift+'";
                        command = "editor.action.blockComment";
                    }
                    {
                        key = "ctrl+alt+s";
                        command = "workbench.action.files.saveFiles";
                    }
                    {
                        key = "ctrl+enter";
                        command = "workbench.action.tasks.build";
                    }
                    {
                        key = "ctrl+enter";
                        command = "workbench.action.tasks.restartTask";
                        when = "taskRunning";
                    }
                    {
                        key = "ctrl+shift+w";
                        command = "-workbench.action.closeWindow";
                    }
                    {
                        key = "ctrl+shift+w";
                        command = "workbench.action.closeActiveEditor";
                    }
                    {
                        key = "ctrl-k ctrl+t";
                        command = "terminal.focus";
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
                        sumneko.lua
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
