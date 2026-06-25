{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "tzlocal";
  version = "5.3.1";

  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-zO/8ft7O/qH1lVQdvW6ZDLHqPRm/AbKAnzYqA915If0=";
  };

  nativeBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "tzlocal" ];

  meta = {
    description = "Tzinfo object for the local timezone";
    homepage = "https://github.com/regebro/tzlocal";
    license = lib.licenses.mit;
  };
}
