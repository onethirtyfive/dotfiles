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
    bash-completion
    bashInteractive

    nix-direnv
    direnv
    wget
    curl
    unzip
    zip
    ack
    jq
    lsof
    htop
    #tree

    nix-prefetch-scripts

    gnupg
    keybase
  # ] ++ [ vscode ]; # vim not from pkgs
  ] ++ [ vim vscode ]; # vim not from pkgs
}

