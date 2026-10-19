{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "rangeparser";
  version = "0.1.3";
  pyproject = true;

  src = fetchPypi {
    pname = "RangeParser";
    inherit (finalAttrs) version;
    hash = "sha256-gjA7Iytg802Lv7/rLfhGE0yjz4e6FfOXbEoWNPjhCOY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "rangeparser" ];

  meta = {
    description = "Parses ranges";
    homepage = "https://pypi.org/project/RangeParser/";
    license = lib.licenses.bsd2;
  };
})
