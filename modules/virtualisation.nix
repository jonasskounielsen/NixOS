{ pkgs-stable, ... }: {
  # Virtualization settings from https://www.youtube.com/watch?v=rCVW8BGnYIc and https://nixos.wiki/wiki/Virt-manager.
  programs.virt-manager.enable = true;

  virtualisation = {
    libvirtd.enable = true;
    libvirtd.qemu = {
      package = pkgs-stable.qemu;
      swtpm.enable = true;
      ovmf.enable = true;
      ovmf.packages = [ pkgs-stable.OVMFFull.fd ]; # Newer versions of OVMFFull do not work; gives missing EFI firmware error
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