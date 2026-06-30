{
  description = "Miguel's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      lanzaboote,
    }:
    {
      nixosConfigurations.mpl = nixpkgs.lib.nixosSystem {
        modules = [
          {
            nix.settings.experimental-features = [
              "nix-command"
              "flakes"
            ];
          }
          ./configuration.nix
          lanzaboote.nixosModules.lanzaboote
          ./lanzaboote.nix
        ];
      };
    };
}
