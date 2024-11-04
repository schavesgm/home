{
  # Install zsh and make it the default shell
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      vim = "nvim";
      ls = "eza --icons";
      lg = "lazygit";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };

  # Make starship the default prompt in the system
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.atuin.enable = true;
  programs.eza.enable = true;
  programs.lazygit.enable = true;
}
