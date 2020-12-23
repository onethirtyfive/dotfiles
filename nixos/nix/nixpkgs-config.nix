{ pkgs }:

let
  inherit (pkgs) callPackage;

  homeDir = builtins.getEnv "HOME";
  nixDotfiles = "${homeDir}/.dotfiles/nix";

  otfVim = callPackage "${nixDotfiles}/onethirtyfive-vim.nix" { inherit pkgs; };
  otfDevenv = callPackage "${nixDotfiles}/onethirtyfive-devenv.nix" { onethirtyfiveVim=otfVim; inherit pkgs; };
  otfDevenvMac = callPackage "${nixDotfiles}/onethirtyfive-devenv-mac.nix" { onethirtyfiveVim=otfVim; inherit pkgs; };
in
{
  allowUnfree = true;

  packageOverrides = pkgs: rec {
    onethirtyfiveDevenv = otfDevenv;
    onethirtyfiveDevenvMac = otfDevenvMac;
  };

  pidgin = {
    openssl = true;
    gnutls = true;
  };
}

