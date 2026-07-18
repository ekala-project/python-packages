{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "textparser";
  version = "0.24.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-VvcI51qp0AKtt22CO6bvFm1+zsHj5MpMHKED+BdWgzU=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "textparser" ];

  meta = {
    description = "Text parser";
    homepage = "https://github.com/eerimoq/textparser";
    license = lib.licenses.mit;
  };
}
