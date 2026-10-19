{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  version = "1.5.1";
  pyproject = true;
  pname = "pandocfilters";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ACtKVV7k68A/i2Ywfih/pJLkp3tOoU0/k0MoKXu0k54=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pandocfilters" ];

  meta = {
    description = "Python module for writing pandoc filters, with a collection of examples";
    homepage = "https://github.com/jgm/pandocfilters";
    license = lib.licenses.mit;
  };
}
