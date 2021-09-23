{ pkgs
, customVim
, customVSCode }:
let
  inherit (pkgs) buildEnv;
in
buildEnv {
  name = "development-environment";
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

    customVim
    customVSCode

    nix-prefetch-scripts

    gitAndTools.gitFull
  ];
}

