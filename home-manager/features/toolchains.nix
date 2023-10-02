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
  python = pkgs.python311;
  pythonPkgs = ps: with ps; [ pip grpcio-tools jupyter ipykernel matplotlib pandas openpyxl seaborn conan ];
  rust = with pkgs; [ rustc cargo clippy rust-analyzer rustfmt ];
in { home.packages = [ (python.withPackages pythonPkgs) pkgs.libcxxStdenv pkgs.go ] ++ c ++ javascript ++ rust; }
