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

  settings = {
    substituters = [
      "http://binarycache.example.com"
      "https://nix-community.cachix.org"
      "https://cache.nixos.org/"
    ];

    trusted-public-keys = [
      "binarycache.example.com-1:dsafdafDFW123fdasfa123124FADSAD"
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
}

