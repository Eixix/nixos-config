{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  packages = with pkgs; [
    (pkgs.luajit.withPackages (ps: [
      ps.cjson
      ps.lpeg
    ]))
  ];
}
