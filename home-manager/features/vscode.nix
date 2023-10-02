{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons

      ms-python.python
      ms-pyright.pyright
      zxh404.vscode-proto3
      ms-toolsai.jupyter
    ];
    userSettings = {
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "catppuccin-mocha";
      "extensions.experimental.affinity" = { "asvetliakov.vscode-neovim" = 1; };
      "explorer.confirmDragAndDrop" = false;
    };
    keybindings = [
      {
        "command" = "vscode-neovim.send";
        "key" = "ctrl+p";
        "when" = "editorTextFocus && neovim.mode != insert";
        "args" = "<C-p>";
      }
      {
        "command" = "vscode-neovim.send";
        "key" = "ctrl+y";
        "when" = "editorTextFocus && neovim.mode != insert";
        "args" = "<C-y>";
      }
      {
        "command" = "vscode-neovim.send";
        "key" = "ctrl+x";
        "when" = "editorTextFocus && neovim.mode != insert";
        "args" = "<C-x>";
      }
    ];
  };
}
