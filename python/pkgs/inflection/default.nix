{
  lib,
  fetchPypi,
  # build-system
  setuptools,
  buildPythonPackage,
}:

buildPythonPackage rec {
  pname = "inflection";
  version = "0.5.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "1a29730d366e996aaacffb2f1f1cb9593dc38e2ddd30c91250c6dde09ea9b417";
  };

  build-system = [ setuptools ];

  meta = {
    homepage = "https://github.com/jpvanhal/inflection";
    description = "Port of Ruby on Rails inflector to Python";
    license = lib.licenses.mit;
  };
}
