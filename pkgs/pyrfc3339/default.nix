{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
  pytz,
}:

buildPythonPackage rec {
  pname = "pyrfc3339";
  version = "2.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-xWmpcU+vEVzbILUegw55jB9N6Nq7B/b/JdIhtdCdjX8=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ pytz ];

  pythonImportsCheck = [ "pyrfc3339" ];

  meta = {
    homepage = "https://github.com/kurtraschke/pyRFC3339";
    description = "Generate and parse RFC 3339 timestamps";
    license = lib.licenses.mit;
  };
}
