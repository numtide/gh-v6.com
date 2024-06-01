{ pkgs, ... }:
pkgs.mkShellNoCC {
  packages = [
    pkgs.terraform
  ];
}
