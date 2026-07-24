{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools-scm,

  # dependencies
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "sievelib";
  version = "1.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Kvuq8lA6/pEt4IgeTFdzg+b5D4dikx+00y8rVBI85FA=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [ typing-extensions ];

  pythonImportsCheck = [ "sievelib" ];

  meta = {
    description = "Client-side Sieve and Managesieve library";
    homepage = "https://github.com/tonioo/sievelib";
    license = lib.licenses.mit;
  };
}
