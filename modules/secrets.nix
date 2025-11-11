{ config, ... }:
{
  # Edits secrets with: sudo SOPS_AGE_KEY_FILE=/etc/sops/age/private_key.txt sops edit secrets.yaml
  sops = {
    defaultSopsFile = ./secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/etc/sops/age/private_key.txt";
    secrets.rclone = {
      owner = config.users.users.jonas.name;
    };
    secrets.hashedPassword = {
      neededForUsers = true;
    };
  };
  users.users.jonas.hashedPasswordFile = config.sops.secrets.hashedPassword.path;
}
