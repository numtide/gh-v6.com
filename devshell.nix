{ pkgs, ... }:
let
  terraform = pkgs.terraform.withPlugins (p: [ p.cloudflare ]);
in
pkgs.mkShellNoCC {
  packages = [
    terraform
  ];
}
