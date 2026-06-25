{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  platformdirs,
  traitlets,
}:

buildPythonPackage rec {
  pname = "jupyter-core";
  version = "5.9.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jupyter";
    repo = "jupyter_core";
    tag = "v${version}";
    hash = "sha256-mAvfyiN8Fdm9U3Ar7xicwOinKfTqk9qrfq/SGiaxNvU=";
  };

  build-system = [ hatchling ];

  dependencies = [
    platformdirs
    traitlets
  ];

  pythonImportsCheck = [ "jupyter_core" ];

  meta = {
    description = "Base package on which Jupyter projects rely";
    homepage = "https://jupyter.org/";
    license = lib.licenses.bsd3;
  };
}
