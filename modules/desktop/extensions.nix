{ pkgs, ... }:
{
  dconf.enable = true;
  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;
    enabled-extensions = with pkgs.gnomeExtensions; [
      todotxt.extensionUuid
      lilypad.extensionUuid
    ];
  };

  home.packages = with pkgs.gnomeExtensions; [
    todotxt
    lilypad
  ];

  dconf.settings = {
    "org/gnome/shell/extensions/lilypad" = {
      show-icons = true;
      reorder = true;
      ignored-order = "@as []";
      lilypad-order = [ "todoTxt" ];
      rightbox-order = [ "lilypad" ];
    };
  };
}
