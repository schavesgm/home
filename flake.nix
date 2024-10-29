{
  description = "Home Manager configuration of s-garciamascaraque";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-24.05";
    };

    # Add home-manager to the configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Import neox as the neovim distribution
    neox.url = "github:schavesgm/neox";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
    let
      pkgs = import nixpkgs { 
        config.allowUnfree = true;
        system = "x86_64-linux";
      };
      specialArgs = { inherit inputs; inherit username; };
      username = "s-garciamascaraque";
    in {
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = inputs // specialArgs;
      };
    };
}
