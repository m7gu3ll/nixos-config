{
  description = "Miguel's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
  };

  outputs =
    { self, nixpkgs }:
    {
      nixosConfigurations.mlp = nixpkgs.lib.nixosSystem {
        modules = [
          {
            nix.settings.experimental-features = [
              "nix-command"
              "flakes"
            ];
          }
          ./configuration.nix
        ];
      };
    };
}
