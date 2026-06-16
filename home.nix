
{ config, pkgs, ... }:

let
  username = "jonathanlowe";
  homeDir = "/home/jonathanlowe";
in
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = username;
  home.homeDirectory = homeDir;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "26.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.file = {
    # Bash
    ".bashrc".source = bash/.bashrc;
    ".bash_functions".source = bash/.bash_functions;
    ".bash_aliases".source = bash/.bash_aliases;
    ".bash_profile".source = bash/.bash_profile;

    # Ghostty
    ".config/ghostty/config.ghostty".source = ghostty/config.ghostty;

    # Git
    ".config/git".source = ./git;

    # Hyprland
    ".config/hyprland".source = ./hypr;

    # Neovim
    ".config/nvim/init.lua".source = nvim/init.lua;
    ".config/nvim/lua".source = nvim/lua;

    # Tmux
    ".config/tmux".source = ./tmux;

    # Waybar
    ".config/waybar".source = ./waybar;
  };
}


