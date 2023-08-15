{
  xdg.configFile."clangd/config.yaml".text = ''
    If:
      PathMatch: .*\.(cpp|hpp)
    CompileFlags:
      Add: [-Wall, -std=gnu++20, -Wno-unused-variable,-Wno-infinite-recursion,-Wno-array-bounds,-Werror=implicit-function-declaration,-Wshadow,-Wno-shadow-field-in-constructor-modified,-Wno-shadow-ivar,-Wuninitialized,-Wunused-label,-Wunused-lambda-capture]
    Index:
      StandartLibrary: Yes
  '';
}
