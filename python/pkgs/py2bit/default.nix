{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "py2bit";
  version = "1.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-SXL4XrOETN+6Q+tUqzyDSaBTbgPf19sHyo00Ryha0gw=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  meta = {
    homepage = "https://github.com/deeptools/py2bit";
    description = "File access to 2bit files";
    license = lib.licenses.mit;
  };
})
