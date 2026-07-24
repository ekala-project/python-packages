{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  blessed,
  cwcwidth,
}:

buildPythonPackage rec {
  pname = "curtsies";
  version = "0.4.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ECoP+/lSEk8b4iL9aYnaTsfM4E5J9hMAnl9UrTdhiCU=";
  };

  build-system = [ setuptools ];

  dependencies = [
    blessed
    cwcwidth
  ];

  pythonImportsCheck = [ "curtsies" ];

  meta = {
    description = "Curses-like terminal wrapper, with colored strings";
    homepage = "https://github.com/bpython/curtsies";
    license = lib.licenses.mit;
  };
}
