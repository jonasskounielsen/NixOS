{ /*config,*/ pkgs, ... }:
{
  imports =
  [
    ./modules/rclone.nix
  ];

  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/jonas/.config/sops/age/private_key.txt";
    secrets.rclone = {
      owner = "jonas";
    };
  };

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
  services.desktopManager.plasma6.enable = true;

  services.flatpak.enable = true;

  services.xserver.xkb = {
    layout = "dk";
    variant = "nodeadkeys";
  };
  console.keyMap = "dk-latin1";

  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      corefonts
      nerd-fonts.hack
    ];
  };

  fileSystems."/usr/share/fonts" = {
    device = "/run/current-system/sw/share/X11/fonts";
    options = [ "bind" ];
  };

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
    extraGroups = [ "wheel" "networkmanager" "dialout" "libvirtd" ];
    packages = [ /* in home.nix */ ];
  };

  # Virtualization settings from https://www.youtube.com/watch?v=rCVW8BGnYIc and https://nixos.wiki/wiki/Virt-manager.
  programs.virt-manager.enable = true;

  virtualisation = {
    libvirtd.enable = true;
    libvirtd.qemu = {
      swtpm.enable = true;
      ovmf.enable = true;
      ovmf.packages = [ pkgs.OVMFFull.fd ];
    };
    spiceUSBRedirection.enable = true;

    podman = {
      enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  systemd.tmpfiles.rules = [
    "L+ /var/lib/libvirt/qemu/win11.xml - - - - ${./vms/win11.xml}"
  ];

  programs.bash = {
    interactiveShellInit =
      (builtins.readFile ./scripts/load_devshells.sh) +
      (builtins.readFile ./scripts/maple_shortcut.sh) +
      (builtins.readFile ./scripts/minesweeper_shortcut.sh) +
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
    yazi
    opentabletdriver
    tuxclocker
    rclone
    distrobox
    wayclip
    virtiofsd
    sops
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
