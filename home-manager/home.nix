{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
let 
  username = "hidehico";
in {
  nixpkgs = {
    overlays = [
      # (import (builtins.fetchTarball {
      #   url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
      # }))
    ];
    config = {
      allowUnfree=true;
    };
  };

  home = {
    username = "hidehico";
    homeDirectory = "/home/hidehico";

    stateVersion = "24.11";
    packages = with pkgs;
    [
      aria2
      black
      delta
      emacs
      fish
      fzf
      gh
      hugo
      isort
      lazydocker
      lazygit
      lua-language-server
      lua54Packages.luacheck
      marksman
      mise
      online-judge-tools
      ruby
      ruff
      sheldon
      shellcheck
      shfmt
      tree-sitter
      typescript-language-server
      vim
      vim-startuptime
      yamlfmt
      zoxide
    ];

    file = {
    };

    sessionVariables = {
    };

    enableNixpkgsReleaseCheck = false;
  };
  programs.home-manager.enable = true;
}
