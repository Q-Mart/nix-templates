{
  description = "Build scala source and run a shell with genart packages";

  inputs.utils.url = "github:numtide/flake-utils";
  inputs.sbtBuild.url = "github:zaninime/sbt-derivation";
  inputs.sbtBuild.inputs.nixpkgs.follows = "nixpkgs";

  outputs = { self, nixpkgs, utils, sbtBuild }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ (self: super: { jre = super.jdk11; }) ];
        };
      in {
        packages.default = sbtBuild.lib.mkSbtDerivation {
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
