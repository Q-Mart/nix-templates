{
  description - "Build scala source and run a shell with genart packages";

  inputs.utils.url = "github:numtide/flake-utils";
  inputs.sbt.url = "github:zaninime/sbt-derivation/refactor";
  inputs.sbt.inputs.nixpkgs.follows = "nixpkgs";

  outputs = {self, nixpkgs, utils, sbt}: utils.lib.eachDefaultSystem(system: {
    packages.default = sbt.lib.mkSbtDerivation {
      pname = "my-scala-package";
      src = self;
    };

    devShell = pkgs.mkShell {buildInputs = with pkgs; [jdk11 scala scalafmt sbt imagemagick ffmpeg ]}
  });
}
