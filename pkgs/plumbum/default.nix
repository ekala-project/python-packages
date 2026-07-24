{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  hatch-vcs,
}:

buildPythonPackage rec {
  pname = "plumbum";
  version = "2.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-IzdR14GcnmdD7BwkBZJ+tPpSooTHuJS9EOKBBqkwmpI=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  pythonImportsCheck = [ "plumbum" ];

  meta = {
    description = "Plumbum: shell combinators library";
    homepage = "https://github.com/tomerfiliba/plumbum";
    license = lib.licenses.mit;
  };
}
