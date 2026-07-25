{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
}:

buildPythonPackage rec {
  pname = "click";
  version = "8.3.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pallets";
    repo = "click";
    tag = version;
    hash = "sha256-LcnAI4hyiuaJ4qnFnbAR5Cft/yvW5tAIjY6qc6K/Nrw=";
  };

  build-system = [ flit-core ];
  meta = {
    homepage = "https://click.palletsprojects.com/";
    description = "Create beautiful command line interfaces in Python";
    longDescription = ''
      A Python package for creating beautiful command line interfaces in a
      composable way, with as little code as necessary.
    '';
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
