{ pkgs }:

let
  inherit (pkgs) callPackage;

  homeDir = builtins.getEnv "HOME";
  nixDotfiles = "${homeDir}/.dotfiles/macos/nix";

  otfVim = callPackage "${nixDotfiles}/onethirtyfive-vim.nix" { inherit pkgs; };
  otfVSCode = callPackage "${nixDotfiles}/onethirtyfive-vscode.nix" { inherit pkgs; };
  otfDevenv = callPackage "${nixDotfiles}/onethirtyfive-devenv.nix" {
    onethirtyfiveVim = otfVim;
    onethirtyfiveVSCode = otfVSCode;
    inherit pkgs;
  };
in
{
  allowUnfree = true;

  packageOverrides = pkgs: rec {
    onethirtyfiveDevenv = otfDevenv;
  };

  # pidgin = {
  #   openssl = true;
  #   gnutls = true;
  # };
}

