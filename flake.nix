{
  description = "Q's flake templates";

  outputs = { self, ... }: {
    templates = {
      scala-genart = {
        path = ./scala-genart;
        description = "Basic Scala project for creating generative art";
      };
    };
  };
}
