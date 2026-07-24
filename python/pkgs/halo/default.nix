{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  colorama,
  log-symbols,
  termcolor,
  six,
  spinners,
}:

buildPythonPackage rec {
  pname = "halo";
  version = "0.0.31";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-e2ejUh7pHVO3FS1O40UoEeHSpjIZdRN3Yus9cAY8ydY=";
  };

  build-system = [ setuptools ];

  dependencies = [
    colorama
    log-symbols
    termcolor
    six
    spinners
  ];

  pythonImportsCheck = [ "halo" ];

  meta = {
    description = "Beautiful Spinners for Terminal, IPython and Jupyter";
    homepage = "https://github.com/manrajgrover/halo";
    license = lib.licenses.mit;
  };
}
