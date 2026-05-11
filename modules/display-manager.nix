{ ... }:
{
  services.displayManager.ly = {
    #enable = true;
    settings = {
      auth_fails = 5;
      auto_login_session = "niri";
      clear_password = true;
    };
  };
}
