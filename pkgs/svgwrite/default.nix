{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "svgwrite";
  version = "1.4.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    hash = "sha256-qPvf1EQzAqZhmn92vJN/xoPa8mKNm3N8iR7Ai4zlJMM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "svgwrite" ];

  meta = {
    description = "Python library to create SVG drawings";
    homepage = "https://github.com/mozman/svgwrite";
    license = lib.licenses.mit;
  };
}
