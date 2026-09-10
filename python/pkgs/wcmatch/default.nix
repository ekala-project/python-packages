{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  bracex,
}:

buildPythonPackage rec {
  pname = "wcmatch";
  version = "11.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-HqK0+meLjKJoJTeY1ZY5Nd85Ey1Hw+JBwKBzIiQAXn0=";
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
