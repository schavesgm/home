{ lib, pkgs, inputs, username, ... }: {
  imports = [ ./modules/shell.nix ];

  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = username;
  home.homeDirectory = "/home/${username}";

  # Select the home manager release version
  home.stateVersion = "24.05";

  # Enable desktop applications in Ubuntu
  targets.genericLinux.enable = true;
  xdg.mime.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # Install neox neovim configuration
    inputs.neox.packages.${pkgs.system}.default

    # Install some terminal applications
    pkgs.git
    pkgs.bottom
    pkgs.fzf
    pkgs.glow
    pkgs.csvlens
    pkgs.google-cloud-sdk-gce
    pkgs.pixi
    pkgs.uv

    # Install some GUI applications
    pkgs.firefox
    pkgs.slack
    pkgs.zotero_7

    # Install some fonts in the configuration
    pkgs.noto-fonts
    (pkgs.nerdfonts.override { fonts = ["IosevkaTermSlab"]; })
    
    # Install some custom scripts
    (pkgs.writeShellScriptBin "update_gcloud_ssh" (lib.readFile ./scripts/update_gcloud_ssh))
  ];

  # Enable font configuration
  fonts.fontconfig.enable = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage plain files is
  # through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "zsh";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
