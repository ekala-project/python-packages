{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "spinners";
  version = "0.0.24";
  pyproject = true;

  src = fetchPypi {
    pname = "spinners";
    inherit version;
    hash = "sha256-HrautHgdcqtC7YoB3PIPMAK/UHQNcVTRL7jJdpv54n8=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "spinners" ];

  meta = {
    description = "Spinners for the Terminal";
    homepage = "https://github.com/manrajgrover/py-spinners";
    license = lib.licenses.mit;
  };
}
