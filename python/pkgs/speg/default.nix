{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "speg";
  version = "0.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    hash = "sha256-EMvvR+Fo38YvFNtXXPHEKAN6K4gc7mw8/O2gQ5wkPnE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "speg" ];

  meta = {
    homepage = "https://github.com/avakar/speg";
    description = "PEG-based parser interpreter with memoization (in time)";
    license = lib.licenses.mit;
  };
}
