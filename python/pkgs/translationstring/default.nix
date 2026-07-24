{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "translationstring";
  version = "1.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-v5R1ONduaboSqxcoOxA1Wp7PvAeOYSNEP0PyEH9jdvM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "translationstring" ];

  meta = {
    description = "Utility library for i18n relied on by various Repoze and Pyramid packages";
    homepage = "https://pylonsproject.org/";
    license = lib.licenses.bsd0;
  };
}
