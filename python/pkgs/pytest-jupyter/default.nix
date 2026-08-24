{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build
  hatchling,
  pytest,
  # runtime
  jupyter-core,
  # optionals
  jupyter-client,
  ipykernel,
  jupyter-server,
  nbformat,
}:

let
  self = buildPythonPackage rec {
    pname = "pytest-jupyter";
    version = "0.11.0";
    pyproject = true;

    src = fetchFromGitHub {
      owner = "jupyter-server";
      repo = "pytest-jupyter";
      tag = "v${version}";
      hash = "sha256-x3Q9Ei4WIMDjjrYfWees30eooWep60EljGYyUyypxqQ=";
    };

    nativeBuildInputs = [ hatchling ];

    buildInputs = [ pytest ];

    propagatedBuildInputs = [ jupyter-core ];

    optional-dependencies = {
      client = [
        jupyter-client
        nbformat
        ipykernel
      ];
      server = [
        jupyter-server
        jupyter-client
        nbformat
        ipykernel
      ];
    };

    meta = {
      description = "Pytest plugin for testing Jupyter core libraries and extensions";
      homepage = "https://github.com/jupyter-server/pytest-jupyter";
      license = lib.licenses.bsd3;
      maintainers = [ ];
    };
  };
in
self
