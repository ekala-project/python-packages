{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "isounidecode";
  version = "0.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-TbCpYsY0GCbJpprKq8L5I6WxJNU6M1voku8pFzvDHFs=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "isounidecode" ];

  # no real tests included, fails to run

  meta = {
    description = "Python package for conversion and transliteration of unicode into ascii or iso-8859-1";
    homepage = "https://github.com/redvasily/isounidecode";
    license = lib.licenses.bsd3;
  };
}
