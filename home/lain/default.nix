{ pkgs, ... }:

{
  imports = [
    ./gnome-system.nix
  ];
  
  environment.systemPackages = with pkgs; [
    qemu_full
    libvirt
  ];

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.users.lain.extraGroups = [ "libvirtd" ];
}
