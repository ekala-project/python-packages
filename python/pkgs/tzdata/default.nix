{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "tzdata";
  version = "2026.6";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-hdLNnAn4HwuynbJ3WfyDr08eYg77gU+MW/i0zE/uzm0=";
  };

  nativeBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "tzdata" ];

  meta = {
    description = "Provider of IANA time zone data";
    homepage = "https://github.com/python/tzdata";
    license = lib.licenses.asl20;
  };
})
