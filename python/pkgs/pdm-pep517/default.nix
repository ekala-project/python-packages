{
  lib,
  buildPythonPackage,
  fetchPypi,
}:

buildPythonPackage rec {
  pname = "pdm-pep517";
  version = "1.1.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-f0kSHnC0Lcopb6yWIhDdLaB6OVdfxWcxN61mFjOyzz8=";
  };

  pythonNamespaces = [ "pdm" ];

  pythonImportsCheck = [ "pdm.pep517" ];

  meta = {
    description = "Yet another PEP 517 backend";
    homepage = "https://github.com/pdm-project/pdm-pep517";
    license = lib.licenses.mit;
  };
}
