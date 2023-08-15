{ pkgs, ... }: {
  home.packages = with pkgs; [ xdg-utils ];

  xdg.enable = true;
  xdg.userDirs.enable = true;
  xdg.userDirs.createDirectories = true;
  xdg.desktopEntries = {
    "nvim" = {
      name = "Neovim";
      exec = "kitty -e nvim";
      terminal = false;
      icon = "nvim";
      mimeType = [
        "text/english"
        "text/plain"
        "text/x-makefile"
        "text/x-c++hdr"
        "text/x-c++src"
        "text/x-chdr"
        "text/x-csrc"
        "text/x-java"
        "text/x-moc"
        "text/x-pascal"
        "text/x-tcl"
        "text/x-tex"
        "application/x-shellscript"
        "text/x-c"
        "text/x-c++"
      ];
    };
  };
  xdg.mimeApps = {
    enable = true;
    defaultApplications = { "inode/directory" = "thunar.desktop"; };
  };
}
