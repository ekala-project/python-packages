{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  bracex,
}:

buildPythonPackage rec {
  pname = "wcmatch";
  version = "10.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-7KxwpccOYrqFS3gxjToUCOhlH48cluWDd0O3Gqak+5I=";
  };

  build-system = [ hatchling ];

  dependencies = [ bracex ];

  pythonImportsCheck = [ "wcmatch" ];

  meta = {
    homepage = "https://github.com/facelessuser/wcmatch";
    description = "Wilcard File Name matching library";
    license = lib.licenses.mit;
  };
}
