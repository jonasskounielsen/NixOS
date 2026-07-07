{ pkgs, config, lib, ... }:
{
  home.activation."fix-secret-permissions-vnc" = lib.hm.dag.entryAfter ["writeBoundary"] ''
    rm ${config.home.homeDirectory}/.config/vncpassword
    base64 -d /run/secrets/vncPassword > ${config.home.homeDirectory}/.config/vncpassword
    chmod 400 ${config.home.homeDirectory}/.config/vncpassword
  '';

  systemd.user.services.vnc = {
    Unit = {
      Description = "TigerVNC server";
      After = [ "network-online.target" ];
      Wants = [ "network-online.target" ];
    };
    Service = {
      Type = "exec";
      ExecStart = ''
        ${pkgs.tigervnc}/bin/w0vncserver \
          --passwordfile=${config.home.homeDirectory}/.config/vncpassword \
          --rfbport=7270
      '';
      Restart = "on-failure";
      RestartSec = 10;
    };
  };
}
