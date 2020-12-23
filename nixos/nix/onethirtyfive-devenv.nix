{ pkgs
, onethirtyfiveVim }:
let
  inherit (pkgs) buildEnv;
in
buildEnv {

  name = "onethirtyfive-devenv";
  paths = with pkgs; [
    awscli

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

    onethirtyfiveVim

    nix-prefetch-scripts

    gitAndTools.gitFull
    gitAndTools.tig

    gimp
    gnupg
    gparted
    keybase
    libreoffice
    vlc

    # unfree
    discord
    slack
    spotify
    google-chrome
    zoom-us
  ];
}

