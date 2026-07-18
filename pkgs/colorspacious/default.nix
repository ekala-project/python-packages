{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  numpy,
}:

buildPythonPackage rec {
  pname = "colorspacious";
  version = "1.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-XpBy6M3KiJ2sRFw1yTYqIsz3WOl7ALef8NWnuj4Rthg=";
  };

  build-system = [ setuptools ];

  dependencies = [ numpy ];

  pythonImportsCheck = [ "colorspacious" ];

  meta = {
    description = "Powerful, accurate, and easy-to-use Python library for doing colorspace conversions";
    homepage = "https://github.com/njsmith/colorspacious";
    license = lib.licenses.mit;
  };
}
