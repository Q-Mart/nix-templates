{
  description = "Q's flake templates";

  outputs = { self, ... }: {
    templates = {
      genart = {
        path = ./genart;
        description = "Basic Java project for creating generative art";
      };
    };
  };
}
