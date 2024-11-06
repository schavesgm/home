{
  # Add some shell aliases in the system
  home.shellAliases = {
    vim = "nvim";
    ls = "eza --icons";
    lg = "lazygit";
  };

  # Install zsh and make it the default shell
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # Add some extra configuration to the .zshrc file
    initExtra = ''export PATH=$PATH:$HOME/.cargo/bin'';

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

  programs.yazi.enable = true;
  programs.atuin.enable = true;
  programs.eza.enable = true;
  programs.lazygit.enable = true;
  programs.ripgrep.enable = true;
  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
      hosts = [ "https://github.com" ];
    };
  };
}
