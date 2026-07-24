{
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  jupyter-client,
  jupyter-core,
  lib,
  nbformat,
  traitlets,
}:

let
  nbclient = buildPythonPackage rec {
    pname = "nbclient";
    version = "0.10.4";
    pyproject = true;

    src = fetchFromGitHub {
      owner = "jupyter";
      repo = "nbclient";
      tag = "v${version}";
      hash = "sha256-D7pgrNRrPT0fGOaHrNt3qeDXdbt1wJk5qfkQeLxsc7g=";
    };

    build-system = [ hatchling ];

    dependencies = [
      jupyter-client
      jupyter-core
      nbformat
      traitlets
    ];

    # circular dependencies if enabled by default
    doCheck = false;
    meta = {
      homepage = "https://github.com/jupyter/nbclient";
      description = "Client library for executing notebooks";
      mainProgram = "jupyter-execute";
      license = lib.licenses.bsd3;
      maintainers = [ ];
    };
  };
in
nbclient
