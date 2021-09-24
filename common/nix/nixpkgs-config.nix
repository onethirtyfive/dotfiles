{ pkgs }:
let
  inherit (pkgs) callPackage;
  nixCustomPackages = ../../common/nix/custom;
in
{
  allowUnfree = true;

  packageOverrides = pkgs: {
    developmentEnvironment = callPackage ./devenv.nix {
      inherit pkgs;
      vim = callPackage "${nixCustomPackages}/vim.nix" { inherit pkgs; };
      vscode = callPackage "${nixCustomPackages}/vscode.nix" { inherit pkgs; };
    };
  };
}

