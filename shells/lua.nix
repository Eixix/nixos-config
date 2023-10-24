{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  packages = with pkgs; [
    (pkgs.lua.withPackages (ps: [
      ps.luasocket
      ps.cjson
    ]))
  ];
}
