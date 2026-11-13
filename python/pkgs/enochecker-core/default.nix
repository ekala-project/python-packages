{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  # dependencies
  pydantic,
}:

buildPythonPackage (finalAttrs: {
  pname = "enochecker-core";
  version = "0.13.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) version;
    pname = "enochecker_core";
    hash = "sha256-A/WcNcp09BNXfgvm1R38ITfok5MHtUwBBsht8XwtvAg=";
  };

  build-system = [ setuptools ];

  dependencies = [ pydantic ];

  pythonImportsCheck = [ "enochecker_core" ];

  # no tests upstream

  meta = {
    description = "Base library for enochecker libs";
    homepage = "https://github.com/enowars/enochecker_core";
    license = lib.licenses.mit;
  };
})
