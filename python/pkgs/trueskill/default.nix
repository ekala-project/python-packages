{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "trueskill";
  version = "0.4.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-nWK0jSQoNp1xK9m+z/n5osqjJeGiq1+TktNL/3V4Z7s=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "trueskill" ];

  meta = {
    description = "Video game rating system";
    homepage = "https://trueskill.org";
    license = lib.licenses.bsd3;
  };
}
