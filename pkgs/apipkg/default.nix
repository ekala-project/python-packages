{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatch-vcs,
  hatchling,
}:

buildPythonPackage rec {
  pname = "apipkg";
  version = "3.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-x6phpPgml/2qZn5wrxUFrPH3QoscJ7iR0gS6eoo8Xg0=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  doCheck = false;

  pythonImportsCheck = [ "apipkg" ];

  meta = {
    homepage = "https://github.com/pytest-dev/apipkg";
    description = "Namespace control and lazy-import mechanism";
    license = lib.licenses.mit;
  };
}
