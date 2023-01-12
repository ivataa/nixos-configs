{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    # Linux Toolchains
    neovim neofetch htop fish wget tealdeer powertop
    # Compilers
    git rustup racket-minimal vscodium gnome.gnome-terminal
    # Others
    synapse
    librewolf qbittorrent thunderbird
    obs-studio audacious gthumb
    standardnotes smplayer
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  services.flatpak.enable = true;

}

