{ pkgs }:

let
  inherit (pkgs) callPackage;

  homeDir = builtins.getEnv "HOME";
  dotfiles = "${homeDir}/.dotfiles";
  commonNix = "${dotfiles}/common/nix";
  nixosNix = "${dotfiles}/nixos/nix";

  onethirtyfiveDevenv = callPackage "${nixosNix}/onethirtyfive-devenv.nix" {
    inherit pkgs;
    onethirtyfiveVim = callPackage "${commonNix}/onethirtyfive-vim.nix" { inherit pkgs; };
  };
in
{
  allowUnfree = true;

  packageOverrides = pkgs: rec {
    inherit onethirtyfiveDevenv;
  };
}

