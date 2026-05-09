{
  description = "A flake to define the devenv for my website";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
    lib = nixpkgs.lib;
  in rec
  {
    devShells."x86_64-linux".default  = pkgs.mkShell {
      packages = with pkgs; [
        zola
        # typst
        # typstPackages.typsite
      ];
      # shellHook = ''
      #   alias deploy="scp -P 69 -r ./public/* 178.104.82.119:/var/www/pmeinhold/"
      # '';
    };
  };
}
