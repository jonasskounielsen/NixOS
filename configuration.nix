{ pkgs, ... }:
{
  # Import all files in ./modules as modules.
  imports = map
    (module: "${./modules}/${module}")
    (builtins.filter (
      item: (builtins.readDir ./modules).${item} == "regular"
    ) (builtins.attrNames (builtins.readDir ./modules)));

  networking.networkmanager.enable = true;

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  programs.niri.enable = true;
  security.pam.services.sddm.kwallet.enable = true;

  services.displayManager.sessionPackages = with pkgs; [
    kdePackages.plasma-workspace
    niri
  ];

  services.flatpak.enable = true;

  services.xserver.xkb = {
    layout = "dk";
    variant = "nodeadkeys";
  };
  console.keyMap = "dk-latin1";

  services.printing.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  users.users.jonas = {
    isNormalUser = true;
    description = "Jonas Skou Nielsen";
    extraGroups = [ "wheel" "networkmanager" "dialout" "docker" ];
    packages = [ /* in home.nix */ ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    extremetuxracer
    kdePackages.kate
    git
    nixd
    nixfmt-rfc-style
    wget
    opentabletdriver
    tuxclocker
    rclone
    distrobox
    wayclip
    virtiofsd
    sops
    brightnessctl
  ];

  virtualisation.docker.enable = true; # For Winboat.

  programs.steam.enable = true;
  programs.firefox.enable = true;

  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };

  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
