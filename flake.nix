{
  description = "Q's flake templates";

  outputs = { self, ... }: {
    templates = {
      genart-java = {
        path = ./genart-java;
        description = "Basic Java project for creating generative art";
        welcomeText = ''
          #Basic Java project for creating generative art
          This downloads cookiecutter and the required JDK.
          The flake runs cookiecutter to generate a boilerplate project with
          processing & QLib imported

          ## Get started
          Run cookiecutter to build out the template
        '';
      };
    };
  };
}
