{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools-scm,
  jaraco-collections,
  jaraco-functools,
  jaraco-logging,
  jaraco-stream,
  jaraco-text,
  more-itertools,
  pytz,
  tempora,
}:

buildPythonPackage rec {
  pname = "irc";
  version = "20.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-jdv9GfcSBM7Ount8cnJLFbP6h7q16B5Fp1vvc2oaPHY=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [
    jaraco-collections
    jaraco-functools
    jaraco-logging
    jaraco-stream
    jaraco-text
    more-itertools
    pytz
    tempora
  ];

  pythonImportsCheck = [ "irc" ];

  meta = {
    description = "IRC (Internet Relay Chat) protocol library for Python";
    homepage = "https://github.com/jaraco/irc";
    license = lib.licenses.mit;
  };
}
