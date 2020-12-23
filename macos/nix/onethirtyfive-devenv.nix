{ pkgs
, onethirtyfiveVim }:
let
  inherit (pkgs) buildEnv;
in
buildEnv {

  name = "onethirtyfive-devenv-mac";
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
    keybase

    onethirtyfiveVim

    nix-prefetch-scripts

    gitAndTools.gitFull
    gitAndTools.tig
  ];
}
