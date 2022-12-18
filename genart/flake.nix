{
  description = "Build scala source and run a shell with genart packages";

  inputs.utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, utils }: 
    utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in rec {
        baseInputs = with pkgs; [ jdk gradle ];
        shellInputs = with pkgs; [ imagemagick ffmpeg ];


        # ________HELLO_______
        # Want to build the code? `nix build` doesn't work yet
        # Use `sbt run`
        # TODO: Work out how to build this in a flake
        
        # packages.default = pkgs.stdenv.mkDerivation {
        #   name = "my-scala-package";
        #   src = self;
        #   buildInputs = baseInputs;
        #   buildPhase = "sbt run";
        # };

        devShell = pkgs.mkShell {
          buildInputs = baseInputs ++ shellInputs;
          shellHook = ''
            export JAVA_HOME=${pkgs.jdk}
            PATH="${pkgs.jdk}/bin:$PATH"
            '';
        };
      });
}
