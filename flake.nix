{
  description = "Arclight's Neovim configuration based on Jake Hamilton's Neovim Plus Ultra";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    snowfall-lib = {
      url = "github:snowfallorg/lib/dev";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;

      src = ./.;

      overlay-package-namespace = "constellation";
      channels-config.allowUnfree = true;

      alias.packages.default = "neovim";
    };
}
