{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "fastimport";
  version = "0.9.16";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-agpvtWqjYH3nGtTnq9VRr+m9rJS6uNLddNjg+Y9S414=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "fastimport" ];

  meta = {
    homepage = "https://github.com/jelmer/python-fastimport";
    description = "VCS fastimport/fastexport parser";
    license = lib.licenses.gpl2Plus;
  };
}
