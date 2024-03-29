{ ... }:
let
  pinnedPkgs = import (builtins.fetchGit {
    name = "nixos-unstable-2021-09-03-vscode-working";
    url = "https://github.com/nixos/nixpkgs/";
    ref = "refs/heads/nixos-unstable";
    rev = "a75326417df32c0354e3244a9461700d214eab82";
  }) {};

  extensions = (with pinnedPkgs.vscode-extensions; [
    bbenoist.nix
    vscodevim.vim
  ] ++ pinnedPkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "nix-env-selector";
      publisher = "arrterian";
      version = "1.0.7";
      sha256 = "0mralimyzhyp4x9q98x3ck64ifbjqdp8cxcami7clvdvkmf8hxhf";
    }
    {
      name = "vscode-standard";
      publisher = "standard";
      version = "2.0.0";
      sha256 = "06rv2vrggib4qdwdryikim0c4z58mvqv3qx62lzqcb8d1jh8wiyp";
    }
  ]);
in pinnedPkgs.vscode-with-extensions.override {
  vscodeExtensions = extensions;
}
