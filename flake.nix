{
  description = "Q's flake templates";

  outputs = { self, ... }: {
    templates = {
      genart-java = {
        path = ./genart-java;
        description = "Basic Java project for creating generative art";
        welcomeText = ''
          # Basic Java project for creating generative art

          This downloads cookiecutte, the JDK, and any required external libraries for Processing.
          The flake runs cookiecutter to generate a boilerplate project with
          processing & QLib imported

          ## Get started
          Run ./generate.sh to generate template project
        '';
      };
    };
  };
}
