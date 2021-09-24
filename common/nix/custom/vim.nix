{ pkgs }:
let
  inherit (pkgs) fetchgit vim_configurable;
  inherit (pkgs.vimUtils) buildVimPluginFrom2Nix;

  homeDir = builtins.getEnv "HOME";
  vimrcFile = "${homeDir}/.vimrc";

  dhallVim = buildVimPluginFrom2Nix {
    name = "dhall-vim";
    src = fetchgit {
      url = "https://github.com/vmchale/dhall-vim.git";
      rev = "2693bfaf9167ac69ee96c1165b4354f03f4d8b24";
      sha256 = "0qm6z8z70cxqqlmxgq497w96nv5sn2gbxnc74balbhpk17bms4m0";
    };
  };

  vimAck = buildVimPluginFrom2Nix {
    name = "vim-ack";
    src = fetchgit {
      url = "https://github.com/mileszs/ack.vim.git";
      rev = "36e40f9ec91bdbf6f1adf408522a73a6925c3042";
      sha256 = "0yppr89hd1jyp0pj56hxdjbn32sr7pj3mihd18wxispvl5dqd6fm";
    };
  };

  vimCSS3Syntax = buildVimPluginFrom2Nix {
    name = "vim-css3-syntax";
    src = fetchgit {
      url = "https://github.com/hail2u/vim-css3-syntax.git";
      rev = "f18eabedc062e974e991db10d911788a3a3c216f";
      sha256 = "05srcglf521n5670dszh559lmvsc4bl7k4msikix1a996qghnm49";
    };
  };

  vimJson = buildVimPluginFrom2Nix {
    name = "vim-json";
    src = fetchgit {
      url = "https://github.com/elzr/vim-json.git";
      rev = "3727f089410e23ae113be6222e8a08dd2613ecf2";
      sha256 = "1c19pqrys45pzflj5jyrm4q6hcvs977lv6qsfvbnk7nm4skxrqp1";
    };
  };

  vimTerraform = buildVimPluginFrom2Nix {
    name = "vim-terraform";
    src = fetchgit {
      url = git://github.com/hashivim/vim-terraform;
      rev = "76799270813db362b13a56f26cd34f668e9e17a4";
      sha256 = "0j3cnnvhs41phz0kiyaprp05vxhf5jaaw5sn5jcn08yc6jhy009r";
    };
  };
in
vim_configurable.customize {
  name = "onethirtyfive-vim";
  vimrcConfig.customRC = builtins.readFile vimrcFile;
  vimrcConfig.vam.knownPlugins = pkgs.vimPlugins // {
    "dhall-vim" = dhallVim;
    "vim-ack" = vimAck;
    "vim-css3-syntax" = vimCSS3Syntax;
    "vim-json" = vimJson;
    "vim-terraform" = vimTerraform;
  };
  vimrcConfig.vam.pluginDictionaries = [
    {
      names = [
        "align"
        "ctrlp"
        "dhall-vim"
        "fugitive"
        "nerdtree"
        "purescript-vim"
        "vim-ack"
        "vim-css3-syntax"
        "vim-json"
        "vim-addon-nix"
        "vim-nix"
        "vim-terraform"
        # "vim-stylish-haskell"
      ];
    }
  ];
}
