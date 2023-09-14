{ pkgs, ... }:
let
  c = with pkgs; [
    gcc13
    glibcLocales
    conan
    cmake
    gnumake
    automake
    autoconf
    gnum4
  ];
  javascript = with pkgs.unstable; [ nodejs ];
  python = pkgs.unstable.python310;
  pythonPkgs = with pkgs.unstable.python310Packages; [ virtualenv pip ];
  rust = with pkgs.unstable; [ rustc cargo clippy rust-analyzer rustfmt ];
in { home.packages = [ python ] ++ c ++ javascript ++ pythonPkgs ++ rust; }
