# modules/virtualization/default.nix
{ ... }:
{
  imports = [
    ./containers.nix
    ./kvm.nix
  ];
}
