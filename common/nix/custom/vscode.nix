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
      version = "2.0.1";
      sha256 = "88amJMLPZH6IaJ4vNkwAKl/LfdlttsblkLB609dpQSw=";
    }
    {
      name = "hexeditor";
      publisher = "ms-vscode";
      version = "1.9.1";
      sha256 = "Yadb7odAZAH0xyXSHuKYNKaQ92am5NwkpOL3uPExH58=";
    }
    {
      name = "vsliveshare";
      publisher = "MS-vsliveshare";
      version = "1.0.5615";
      sha256 = "Zr6vmtEaRA07PLmcU/rnC2fraEZwHr4V3A939j5LKI0=";
    }
    {
      name = "rainbow-csv";
      publisher = "mechatroner";
      version = "2.4.0";
      sha256 = "zQW4Juk5+/51Xq6JsR9K645JRBm8lu6r+sgA6/IwtEU=";
    }
    {
      name = "haskell";
      publisher = "Haskell";
      version = "2.2.1";
      sha256 = "06H4RUmsTOM0ZBFl7NV3T/EBd9NPK0UjUW0s/Q946ZI=";
    }
    {
      name = "language-haskell";
      publisher = "justusadam";
      version = "3.6.0";
      sha256 = "rZXRzPmu7IYmyRWANtpJp3wp0r/RwB7eGHEJa7hBvoQ=";
    }
  ]);
in pinnedPkgs.vscode-with-extensions.override {
  vscodeExtensions = extensions;
}
