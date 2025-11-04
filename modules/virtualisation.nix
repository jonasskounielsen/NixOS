{ pkgs-20075955, ... }: {
  # Virtualization settings from https://www.youtube.com/watch?v=rCVW8BGnYIc and https://nixos.wiki/wiki/Virt-manager.
  programs.virt-manager.enable = true;

  users.users.jonas.extraGroups = [ "libvirtd" ];

  virtualisation = {
    libvirtd.enable = true;
    libvirtd.qemu = {
      package = pkgs-20075955.qemu;
      swtpm.enable = true;
    };
    spiceUSBRedirection.enable = true;

    podman = {
      enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  systemd.tmpfiles.rules = [
    "L+ /var/lib/libvirt/qemu/win11.xml - - - - ${./virtualisation/win11.xml}"
  ];
}
