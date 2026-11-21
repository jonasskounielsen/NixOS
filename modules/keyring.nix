{ lib, ... }:
{
  services.oo7.enable = true;

  services.gnome.gnome-keyring.enable = lib.mkForce false;

  security.pam.services.login.oo7.enable = true;
}
