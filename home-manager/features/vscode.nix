{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      asvetliakov.vscode-neovim
      bradlc.vscode-tailwindcss
      svelte.svelte-vscode
    ];
    userSettings = {
      workbench = {
        iconTheme = "catppuccin-mocha";
        colorTheme = "Catppuccin Mocha";
      };
    };
  };
}
