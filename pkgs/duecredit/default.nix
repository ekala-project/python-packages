{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
  citeproc-py,
  looseversion,
  requests,
}:

buildPythonPackage rec {
  pname = "duecredit";
  version = "0.11.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-e1wa4Qkn+eAs9NVOLHSoqgDNKcONY33v48lI09jp8zo=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    citeproc-py
    looseversion
    requests
  ];

  pythonImportsCheck = [ "duecredit" ];

  meta = {
    description = "Simple framework to embed references in code";
    homepage = "https://github.com/duecredit/duecredit";
    license = lib.licenses.bsd2;
  };
}
