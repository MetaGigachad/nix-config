{ pkgs, outputs, ... }: {
  home.packages = with pkgs; [
    neovim

    # [Plugin deps]

    # telescope (gitignore)
    ripgrep

    # telescope file browser (gitignore)
    fd

    # [Languages]

    # cpp
    llvmPackages_16.clang-unwrapped

    # lua
    lua-language-server
    stylua


    # nix
    nil
    nixfmt

    # python
    pyright
    python311Packages.autopep8

    # cmake
    cmake-language-server

    # web
    nodePackages.vscode-langservers-extracted
    nodePackages.typescript-language-server
    nodePackages.svelte-language-server
    nodePackages."@tailwindcss/language-server"
  ];
}
