{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  packages = with pkgs; [
    (pkgs.python311.withPackages (ps: [
      ps.pip
      ps.pygame
    ]))
  ];
  shellHook = ''
    export PIP_PREFIX=$(pwd)/_build/pip_packages
    export PYHTONPATH="$PIP_PREFIX/${pkgs.python3.sitePackages}:$PYHTONPATH"
    export PATH="$PIP_PREFIX/bin:$PATH"
    unset SOURCE_DATE_EPOCH
  '';
}
