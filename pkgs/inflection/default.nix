{
  lib,
  fetchPypi,
  buildPythonPackage,
}:

buildPythonPackage rec {
  pname = "inflection";
  version = "0.5.1";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1a29730d366e996aaacffb2f1f1cb9593dc38e2ddd30c91250c6dde09ea9b417";
  };

  meta = {
    homepage = "https://github.com/jpvanhal/inflection";
    description = "Port of Ruby on Rails inflector to Python";
    license = lib.licenses.mit;
  };
}
