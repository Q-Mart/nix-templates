{
  description = "Build scala source and run a shell with genart packages";

  inputs.utils.url = "github:numtide/flake-utils";
  inputs.sbt.url = "github:zaninime/sbt-derivation";
  inputs.sbt.inputs.nixpkgs.follows = "nixpkgs";

  outputs = { self, nixpkgs, utils, sbt }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ (self: super: { jre = super.jdk11; }) ];
        };
      in {
        packages.default = sbt.lib.mkSbtDerivation {
          pname = "my-scala-package";
          src = self;
        };

        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            jdk11
            scala
            scalafmt
            sbt
            imagemagick
            ffmpeg
          ];
        };
      });
}
