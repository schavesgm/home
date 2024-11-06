# Home-manager configuration for non-nixOS systems

This repository contains my `home-manager` configuration for non-nixOS systems (mainly `Ubuntu`). To
install this configuration, first install `nix` in your system using the [official
guide](https://nixos.org/download/). This usually amounts to just running:

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

Once `nix` is available in your system, copy this repository to `~/.config/home-manager` and run the
following command:

```bash
home-manager switch
```
