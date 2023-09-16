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
  javascript = with pkgs; [ nodejs ];
  python = pkgs.python310;
  pythonPkgs = with pkgs.python310Packages; [ virtualenv pip ];
  rust = with pkgs; [ rustc cargo clippy rust-analyzer rustfmt ];
in { home.packages = [ python ] ++ c ++ javascript ++ pythonPkgs ++ rust; }
