{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  sphinx,
}:

buildPythonPackage (finalAttrs: {
  pname = "sphinxcontrib-moderncmakedomain";
  version = "4.4.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) version;
    pname = "sphinxcontrib_moderncmakedomain";
    hash = "sha256-I/gBiLskGk2miG+eSyBNxiuudgYKQapZe5DwTSd0EKg=";
  };

  build-system = [ hatchling ];

  dependencies = [ sphinx ];

  pythonNamespaces = [ "sphinxcontrib" ];

  meta = {
    description = "Sphinx extension which renders CMake documentation";
    homepage = "https://github.com/scikit-build/moderncmakedomain";
    license = lib.licenses.bsd3;
  };
})
