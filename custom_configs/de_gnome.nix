{ config, pkgs, ... }:

{
  # Enable GDM and Gnome
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Enable PipeWire
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Disable Gnome bloat
  environment.gnome.excludePackages = with pkgs.gnome; [
    baobab cheese eog epiphany gedit simple-scan totem yelp evince file-roller
    geary seahorse gnome-calculator gnome-calendar gnome-clocks 
    gnome-contacts gnome-font-viewer gnome-logs gnome-maps gnome-music pkgs.gnome-photos
    gnome-system-monitor gnome-weather gnome-disk-utility pkgs.gnome-connections
    pkgs.gnome-tour pkgs.gnome-console pkgs.gnome-text-editor gnome-characters
  ];

  # Systray Icons
  environment.systemPackages = with pkgs; [ gnomeExtensions.appindicator ];
#gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
#gsettings set org.gnome.mutter edge-tiling true
#gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
#gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
#gsettings set org.gnome.mutter dynamic-workspaces false
#gsettings set org.gnome.desktop.wm.preferences num-workspaces 4

}
