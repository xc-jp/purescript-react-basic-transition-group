{ pkgs ? import <nixpkgs> { } }:
let
  easy-ps = import
    (pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "easy-purescript-nix";
      rev = "a5fd0328827ac46954db08f624c09eba981f1ab2";
      sha256 = "1g3bk2y8hz0y998yixz3jmvh553kjpj2k7j0xrp4al1jrbdcmgjq";
    })
    {
      inherit pkgs;
    };
  modules = pkgs.yarn2nix-moretea.mkYarnModules {
    name = "transitions-modules";
    pname = "transitions-modules";
    version = "1.0.0";
    packageJSON = ./package.json;
    yarnLock = ./yarn.lock;
  };
  dev-binaries = pkgs.runCommand "symlink-transitions-dev-bins" { } ''
    mkdir $out
    ln -s ${modules}/node_modules/.bin $out/bin
  '';
in
pkgs.stdenv.mkDerivation {
  name = "transitions-shell";
  buildInputs = [
    pkgs.yarn2nix
    pkgs.yarn
    pkgs.spago
    easy-ps.purs-0_13_8
    dev-binaries
  ];
}
