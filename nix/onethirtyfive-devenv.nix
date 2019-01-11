{ pkgs
, onethirtyfiveVim }:
let
  inherit (pkgs) buildEnv;
in
buildEnv {

  name = "onethirtyfive-devenv";
  paths = with pkgs; [
    bash
    bashCompletion
    bashInteractive

    wget
    curl
    unzip
    zip
    ack

    onethirtyfiveVim

    nix-prefetch-scripts

    gitAndTools.gitFull
    gitAndTools.tig

    keybase
    (pidgin.override { plugins = [ pidginotr ]; })
  ];
}

