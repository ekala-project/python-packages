{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
}:

buildPythonPackage rec {
  pname = "testfixtures";
  version = "12.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-2AfOub3W6nzAZjNw3VVoM5BWs13BXCbv/RriZ+MjrPE=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "testfixtures" ];

  meta = {
    description = "Collection of helpers and mock objects for unit tests and doc tests";
    homepage = "https://github.com/Simplistix/testfixtures";
    license = lib.licenses.mit;
  };
}
