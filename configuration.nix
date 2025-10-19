{ pkgs, ... }:
{
  imports = map
    (module: "${./modules}/${module}")
    (builtins.filter (
      item: (builtins.readDir ./modules).${item} == "regular"
    ) (builtins.attrNames (builtins.readDir ./modules)));

  nix.registry.system = {
    from = {
      type = "indirect";
      id = "system";
    };
    to = {
      type = "path";
      path = "/home/jonas/NixOS";
    };
  };

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Copenhagen";
  i18n.defaultLocale = "en_DK.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "da_DK.UTF-8";
    LC_IDENTIFICATION = "da_DK.UTF-8";
    LC_MEASUREMENT = "da_DK.UTF-8";
    LC_MONETARY = "da_DK.UTF-8";
    LC_NAME = "da_DK.UTF-8";
    LC_NUMERIC = "da_DK.UTF-8";
    LC_PAPER = "da_DK.UTF-8";
    LC_TELEPHONE = "da_DK.UTF-8";
    LC_TIME = "da_DK.UTF-8";
  };

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  programs.niri.enable = true;

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

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  users.users.jonas = {
    isNormalUser = true;
    description = "Jonas Skou Nielsen";
    extraGroups = [ "wheel" "networkmanager" "dialout" "libvirtd" "ydotool" ];
    packages = [ /* in home.nix */ ];
  };

  programs.bash = {
    interactiveShellInit =
      (builtins.readFile ./scripts/load_devshells.sh) +
      (builtins.readFile ./scripts/yazi_cd.sh);
    promptInit = ''PS1="\n\[\e[38;5;46;1m\][(''${SHLVL})\u@\h:\w]\$\[\e[0m\] "'';
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
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

  programs.steam.enable = true;
  programs.firefox.enable = true;

  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  services.openssh.enable = true;

  networking.firewall = {
    # KDE Connect uses ports 1714-64
    allowedTCPPortRanges = [
      { from = 1714; to = 1764; }
    ];
    allowedUDPPortRanges = [
      { from = 1714; to = 1764; }
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
