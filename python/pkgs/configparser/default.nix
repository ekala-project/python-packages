{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "configparser";
  version = "7.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-LhSDecdYBuSrh5vqYkV3TGW2IGI29LPXTYIxyxxGx0E=";
  };

  postPatch = ''
    sed -i "/coherent\.licensed/d" pyproject.toml
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "configparser" ];

  meta = {
    description = "Updated configparser from Python 3.7 for Python 2.6+";
    homepage = "https://github.com/jaraco/configparser";
    license = lib.licenses.mit;
  };
})
