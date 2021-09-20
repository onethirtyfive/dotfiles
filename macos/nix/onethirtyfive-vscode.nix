{ pkgs, ... }:
let
  extensions = (with pkgs.vscode-extensions; [
    bbenoist.nix
    vscodevim.vim
  ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
      name = "nix-env-selector";
      publisher = "arrterian";
      version = "1.0.7";
      sha256 = "0mralimyzhyp4x9q98x3ck64ifbjqdp8cxcami7clvdvkmf8hxhf";
  }]);
in pkgs.vscode-with-extensions.override {
  vscodeExtensions = extensions;
}
