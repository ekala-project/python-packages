{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pyxdg";
  version = "0.28";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Mme7MHTpNN8gKvLuCGhXVIQQhYHm88sAavHaNTleiLQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "xdg" ];

  meta = {
    description = "Contains implementations of freedesktop.org standards";
    homepage = "http://freedesktop.org/wiki/Software/pyxdg";
    license = lib.licenses.lgpl2;
  };
}
