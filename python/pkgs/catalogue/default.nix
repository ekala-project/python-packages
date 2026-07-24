{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "catalogue";
  version = "2.0.10";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-T1baqUCRPT8J1YnBkcdOWm1Rdis6njfdU7dDev1s2hU=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "catalogue" ];

  meta = {
    description = "Tiny library for adding function or object registries";
    homepage = "https://github.com/explosion/catalogue";
    license = lib.licenses.mit;
  };
}
