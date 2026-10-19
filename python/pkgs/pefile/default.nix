{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pefile";
  version = "2024.8.26";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-P/bF2LQ+jDe7bm3VCFZY1linoL3NILagex/PwcTp1jI=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pefile" ];

  meta = {
    description = "Multi-platform Python module to parse and work with Portable Executable (aka PE) files";
    homepage = "https://github.com/erocarrera/pefile";
    license = lib.licenses.mit;
  };
})
