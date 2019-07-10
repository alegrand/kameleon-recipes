# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "ahci" "ehci_pci" "megaraid_sas" "sd_mod" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-label/System";
      fsType = "ext4";
    };

  swapDevices =
    [ 
#{ device = "/dev/disk/by-label/swap"; }
    ];

  nix.maxJobs = lib.mkDefault 32;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
