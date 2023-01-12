{ config, pkgs, ...}:
{
  imports = [
    ./toolchains.nix
    ./de_gnome.nix
  ];
}
