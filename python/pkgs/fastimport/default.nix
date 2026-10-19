{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "fastimport";
  version = "0.9.16";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-agpvtWqjYH3nGtTnq9VRr+m9rJS6uNLddNjg+Y9S414=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "fastimport" ];

  meta = {
    homepage = "https://github.com/jelmer/python-fastimport";
    description = "VCS fastimport/fastexport parser";
    license = lib.licenses.gpl2Plus;
  };
})
