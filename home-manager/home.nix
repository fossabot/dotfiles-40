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
    config = {
      allowUnfree=false;
    };
  };

  home = {
    username = "hidehico";
    homeDirectory = "/home/hidehico";

    stateVersion = "24.11";
    packages = with pkgs;
    [
      black
      delta
      deno
      emacs
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
      selene
      sheldon
      tree-sitter
      vim
    ];

    file = {
    };

    sessionVariables = {
    };

    enableNixpkgsReleaseCheck = false;
  };
  programs.home-manager.enable = true;
}
