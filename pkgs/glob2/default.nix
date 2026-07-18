{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "glob2";
  version = "0.7";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-hcPb0HyKom1j16rO40+obpqRo4c7wwv2LsRuUx+Sq4w=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "glob2" ];

  meta = {
    description = "Version of the glob module that can capture patterns and supports recursive wildcards";
    homepage = "https://github.com/miracle2k/python-glob2/";
    license = lib.licenses.bsd3;
  };
})
