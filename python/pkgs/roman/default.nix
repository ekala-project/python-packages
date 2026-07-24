{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "roman";
  version = "5.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-J1/p9GKQ99D/rqHDMlG5K45GOs4jZgUIzu9SLnWHy28=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "roman" ];

  meta = {
    description = "Integer to Roman numerals converter";
    homepage = "https://pypi.org/project/roman/";
    license = lib.licenses.psfl;
  };
}
