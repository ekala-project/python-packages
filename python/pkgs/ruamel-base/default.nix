{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "ruamel-base";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "ruamel.base";
    inherit (finalAttrs) version;
    sha256 = "1wswxrn4givsm917mfl39rafgadimf1sldpbjdjws00g1wx36hf0";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "ruamel.base" ];

  pythonNamespaces = [ "ruamel" ];

  meta = {
    description = "Common routines for ruamel packages";
    homepage = "https://sourceforge.net/projects/ruamel-base/";
    license = lib.licenses.mit;
  };
})
