{
  config,
  pkgs,
  lib,
  ...
}:

let
  user = config.common.username;
in
{
  i18n = {
    extraLocales = [ "zh_CN.UTF-8/UTF-8" ];
    inputMethod = {
      enable = true;
      type = "ibus";
      ibus.engines = with pkgs.ibus-engines; [
        libpinyin
      ];
    };
  };

  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    gnome.sushi.enable = true;
    xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };

  users.users.${user}.isNormalUser = lib.mkDefault true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
    gnome-music
    showtime
    epiphany
    gnome-console
  ];

  home-manager.users.${user} = {
    imports = [ ./home-manager.nix ];
    home.packages = with pkgs; [
      gnome-themes-extra
      adwaita-qt
    ];
    gtk = {
      enable = true;
      colorScheme = "dark";
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
    };
    qt = {
      enable = true;
      style = {
        name = "adwaita-dark";
        package = pkgs.adwaita-qt;
      };
    };
  };
}
