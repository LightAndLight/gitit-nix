{ nixpkgs ? import <nixpkgs> {}, compiler ? "default", doBenchmark ? false }:

let

  inherit (nixpkgs) pkgs;

  f = import ./gitit.nix;

  haskellPackages =
    (if compiler == "default"
     then pkgs.haskellPackages
     else pkgs.haskell.packages.${compiler}).override {
     overrides = self: super: {
       exceptions = self.callHackage "exceptions" "0.8.3" {};
       skylighting = self.callPackage (import ./skylighting.nix) {};
       skylighting-core = self.callPackage (import ./skylighting-core.nix) {};
     };
  };

  variant = if doBenchmark then pkgs.haskell.lib.doBenchmark else pkgs.lib.id;

  drv = variant (haskellPackages.callPackage f {});

in

  if pkgs.lib.inNixShell then drv.env else drv
