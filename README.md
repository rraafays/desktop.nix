# desktop

GNOME session, ibus, GTK/Qt theming, and declarative dconf for `config.common.username`.

- NixOS: GDM, GNOME, ibus (libpinyin), locale, excluded default apps
- Home Manager: Adwaita GTK/Qt, `dconf load` from `dconf/settings.ini` on activate

Requires **`./common`** only (defaults `isNormalUser`). Enables PipeWire for GNOME audio. Skip on headless hosts. See [dconf/README.md](dconf/README.md).
