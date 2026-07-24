{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "unicodecsv";
  version = "0.14.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-AYwIA31IZJoEEgY/9O2ibqqB7/FUbb/6UfpSkydv9/w=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "unicodecsv" ];

  meta = {
    description = "Drop-in replacement for Python2's stdlib csv module, with unicode support";
    homepage = "https://github.com/jdunck/python-unicodecsv";
    license = lib.licenses.bsd2WithViews;
  };
}
