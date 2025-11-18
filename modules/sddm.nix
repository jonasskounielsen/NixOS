{ ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  security.pam.services.sddm.kwallet.enable = true;
}
