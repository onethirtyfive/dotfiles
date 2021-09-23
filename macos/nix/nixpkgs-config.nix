{ pkgs }:

let
  inherit (pkgs) callPackage;

  developmentEnvironment = callPackage ./devenv.nix {
    inherit pkgs;
    customVim = callPackage ../../common/nix/custom-vim.nix { inherit pkgs; };
    customVSCode = callPackage ./custom-vscode.nix { inherit pkgs; };
  };
in
{
  allowUnfree = true;

  packageOverrides = pkgs: {
    inherit developmentEnvironment;
  };
}

