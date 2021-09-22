{ pkgs
, onethirtyfiveVim
, onethirtyfiveVSCode }:
let
  inherit (pkgs) buildEnv;
in
buildEnv {
  name = "onethirtyfive-devenv";
  paths = with pkgs; [
    # awscli

    bash
    bashCompletion
    bashInteractive

    direnv
    wget
    curl
    unzip
    zip
    ack
    jq
    lsof
    terraform
    tree
    gnupg

    onethirtyfiveVim
    onethirtyfiveVSCode

    nix-prefetch-scripts

    gitAndTools.gitFull
  ];
}
