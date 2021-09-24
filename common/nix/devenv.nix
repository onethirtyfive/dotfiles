{ pkgs
, vim
, vscode }:
let
  inherit (pkgs) buildEnv;
in
buildEnv {
  name = "development-environment";
  paths = with pkgs; [
    bash
    bashCompletion
    bashInteractive

    gitAndTools.gitFull

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

    nix-prefetch-scripts

    gnupg
    keybase
  ] ++ [ vim vscode ]; # vim not from pkgs
}

