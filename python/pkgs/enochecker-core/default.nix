{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "enochecker-core";
  version = "0.10.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) version;
    pname = "enochecker_core";
    hash = "sha256-N41p2XRCp55rcPXLpA4rPIARsva/dQzK8qafjzXtavI=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "enochecker_core" ];

  # no tests upstream

  meta = {
    description = "Base library for enochecker libs";
    homepage = "https://github.com/enowars/enochecker_core";
    license = lib.licenses.mit;
  };
})
