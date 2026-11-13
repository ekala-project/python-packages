{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "patch-ng";
  version = "1.19.1";
  pyproject = true;

  src = fetchPypi {
    pname = "patch_ng";
    inherit (finalAttrs) version;
    hash = "sha256-A2o8wAE07FPzfpIzOVjudeEX8uYqXsK4XHEi5egVwp4=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "patch_ng" ];

  meta = {
    homepage = "https://github.com/conan-io/python-patch";
    description = "Library to parse and apply unified diffs";
    license = lib.licenses.mit;
  };
})
