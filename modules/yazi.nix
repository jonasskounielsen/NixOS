{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    plugins = {
      inherit (pkgs.yaziPlugins)
        git
        ouch
        chmod
        full-border;
    };
    initLua = ./yazi/init.lua;
    settings = {
      keymap = {
        mgr.prepend_keymap = [
          {
            on = "y";
            run = [ "shell -- head -n 1000 \"$@\" | waycopy" "yank" ];
          }
          {
            on = [ "c" "m" ];
            run = "plugin chmod";
            desc = "Chmod on selected files";
          }
        ];
      };
      yazi = {
        plugin = {
          prepend_fetchers = [
            {
              id   = "git";
              name = "*";
              run  = "git";
            }
            {
              id   = "git";
              name = "*/";
              run  = "git";
            }
          ];
          prepend_previewers = [ # Generates incorrect TOML, not sure how to fix
            { mime = "application/*zip";            run = "ouch"; }
            { mime = "application/x-tar";           run = "ouch"; }
            { mime = "application/x-bzip2";         run = "ouch"; }
            { mime = "application/x-7z-compressed"; run = "ouch"; }
            { mime = "application/x-rar";           run = "ouch"; }
            { mime = "application/vnd.rar";         run = "ouch"; }
            { mime = "application/x-xz";            run = "ouch"; }
            { mime = "application/xz";              run = "ouch"; }
            { mime = "application/x-zstd";          run = "ouch"; }
            { mime = "application/zstd";            run = "ouch"; }
            { mime = "application/java-archive";    run = "ouch"; }
          ];
        };
      };
    };
  };
}