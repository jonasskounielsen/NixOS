{ config, pkgs, ... }:
let
  homeDir = config.users.users.jonas.home;
  rclone-service = remoteName: mountDir: {
    description = "Rclone automount of Onedrive-skole";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    serviceConfig = {
      Type = "notify";
      ExecStart = ''
        ${pkgs.rclone}/bin/rclone mount \
          ${remoteName}: ${mountDir} \
          --config ${homeDir}/.config/rclone/rclone.conf \
          --vfs-cache-mode=writes \
          --allow-other
      '';
      ExecStop = "${pkgs.fuse3}/bin/fusermount -u ${mountDir}";
      Restart = "on-failure";
      RestartSec = 10;
    };
    wantedBy = [ "multi-user.target" ];
  };
in
{
  systemd.services."rclone-onedrive-skole" =
    rclone-service "Onedrive-skole" "${homeDir}/Onedrive-skole";

  systemd.services."rclone-onedrive-personlig" =
    rclone-service "Onedrive-personlig" "${homeDir}/Onedrive-personlig";
}
