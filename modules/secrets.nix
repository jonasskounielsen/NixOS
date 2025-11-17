{ config, ... }:
{
  # Edits secrets with: sudo SOPS_AGE_KEY_FILE=/etc/sops/age/private_key.txt sops edit secrets.yaml
  sops = {
    defaultSopsFile = ./secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/etc/sops/age/private_key.txt";
    secrets = {
      onedriveSkoleApiToken = {
        owner = config.users.users.jonas.name;
      };
      onedrivePersonligApiToken = {
        owner = config.users.users.jonas.name;
      };
      hashedPassword = {
        neededForUsers = true;
      };
      jonasSshPrivateKey = {
        owner = config.users.users.jonas.name;
      };
    };
    templates = {
      rclone = {
        owner = config.users.users.jonas.name;
        content = ''
          [Onedrive-skole]
          type = onedrive
          token = ${config.sops.placeholder.onedriveSkoleApiToken}
          drive_id = b!-S8H_Z9QJkawEe2Iq19dVT54CpKD46VNm6VTk--GEglKZmnp_SMuRYP5UwIlRdBv
          drive_type = business

          [Onedrive-personlig]
          type = onedrive
          token = ${config.sops.placeholder.onedrivePersonligApiToken}
          drive_id = 72D272DD6C3C7C91
          drive_type = personal
        '';
      };
    };
  };
  users.users.jonas.hashedPasswordFile = config.sops.secrets.hashedPassword.path;
}
