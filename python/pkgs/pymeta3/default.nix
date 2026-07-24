{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "PyMeta3";
  version = "0.5.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-GL2jJtmpu/WHv8DuC8loZJZNeLBnKIvPVdTZhoHQW8s=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pymeta" ];

  meta = {
    description = "Pattern-matching language based on OMeta for Python 3 and 2";
    homepage = "https://github.com/wbond/pymeta3";
    license = lib.licenses.mit;
  };
}
