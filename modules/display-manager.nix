{ ... }:
{
  services.displayManager.sddm = {
    #enable = true;
    #wayland.enable = true;
  };

  services.displayManager.ly = {
    enable = true;
    settings = {
      auth_fails = 5;
      auto_login_session = "niri";
      auto_login_user = "jonas";
      clear_password = true;
    };
  };

  #security.pam.services.sddm.kwallet.enable = true;
}
