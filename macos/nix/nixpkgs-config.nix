{ pkgs }:

let
  inherit (pkgs) callPackage;

  homeDir = builtins.getEnv "HOME";
  dotfiles = "${homeDir}/.dotfiles";
  commonNix = "${dotfiles}/common/nix";
  macosNix = "${dotfiles}/macos/nix";

  onethirtyfiveDevenv = callPackage "${macosNix}/onethirtyfive-devenv.nix" {
    inherit pkgs;
    onethirtyfiveVim = callPackage "${commonNix}/onethirtyfive-vim.nix" { inherit pkgs; };
    onethirtyfiveVSCode = callPackage "${macosNix}/onethirtyfive-vscode.nix" { inherit pkgs; };
  };
in
{
  allowUnfree = true;

  packageOverrides = pkgs: rec {
    inherit onethirtyfiveDevenv;
  };
}

