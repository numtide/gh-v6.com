{
  description = "my flake";

  # Add all your dependencies here
  inputs = {
    blueprint.url = "github:numtide/blueprint";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  # Keep the magic invocations to minimum.
  outputs = inputs: inputs.blueprint {
    inherit inputs;
    nixpkgs.config.allowUnfree = true;
  };
}
