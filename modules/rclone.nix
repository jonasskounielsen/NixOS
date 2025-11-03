{ config, pkgs, ... }:
let
  inherit (pkgs) lib;
  homeDir = config.users.users.jonas.home;
  rclone-service = remoteName: remotePath: mountDir: extraOptions: {
    description = "Rclone automount of ${remoteName}:${remotePath}";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    serviceConfig = {
      Type = "notify";
      ExecStart = ''
        ${pkgs.rclone}/bin/rclone mount \
          ${remoteName}:${remotePath} ${mountDir} \
          --config ${config.sops.secrets.rclone.path} \
          --allow-other \
          ${lib.concatStringsSep " \\\n" extraOptions}
      '';
      ExecStop = "${pkgs.fuse3}/bin/fusermount -u ${mountDir}";
      Restart = "on-failure";
      RestartSec = 10;
    };
    wantedBy = [ "multi-user.target" ];
  };
in
{
  systemd.services."rclone-onedrive-skole" = rclone-service
    "Onedrive-skole"
    "/Fag"
    "${homeDir}/Onedrive-skole"
    [ "--vfs-cache-mode=writes" ];

  systemd.services."rclone-onedrive-personlig" = rclone-service
    "Onedrive-personlig"
    "/"
    "${homeDir}/Onedrive-personlig"
    [ "--vfs-cache-mode=writes" ];
}
