{ pkgs }:
let
  inherit (pkgs) fetchgit vim_configurable;
  inherit (pkgs.vimUtils) buildVimPluginFrom2Nix;

  homeDir = builtins.getEnv "HOME";
  vimrcFile = "${homeDir}/.vimrc";

  vimAck = buildVimPluginFrom2Nix {
    name = "vim-ack";
    src = fetchgit {
      url = git://github.com/mileszs/ack.vim.git;
      rev = "6e04746a63dd2453601ae36c83d53fe2021a45f4";
      sha256 = "0453ghmaaqwv6z8a3sncd3jxs9j050sp9ymiw2aqpc1a28kdlrv8";
    };
  };

  vimJson = buildVimPluginFrom2Nix {
    name = "vim-json";
    src = fetchgit {
      url = git://github.com/elzr/vim-json.git;
      rev = "a05984fbf7a668361607b091d271b81fa34c7c83";
      sha256 = "0011dfvp78zh2ggs9mzdaby2fm372lrz1j9y2ffbxkv6ygmwmwan";
    };
  };
in
vim_configurable.customize {
  name = "onethirtyfive-vim";
  vimrcConfig.customRC = builtins.readFile vimrcFile;
  vimrcConfig.vam.knownPlugins = pkgs.vimPlugins // {
    "vim-ack" = vimAck;
    "vim-json" = vimJson;
  };
  vimrcConfig.vam.pluginDictionaries = [
    {
      names = [
        "align"
        "ctrlp"
        "fugitive"
        "nerdtree"
        "vim-ack"
        "vim-json"
        "vim-addon-nix"
        "vim-nix"
        # "vim-stylish-haskell"
      ];
    }
  ];
}
