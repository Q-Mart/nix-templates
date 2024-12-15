{
  description = "Q's flake templates";

  outputs = { self, ... }: {
    templates = {
      genart-java = {
        path = ./genart-java;
        description = "Basic Java project for creating generative art";
      };
    };
  };
}
