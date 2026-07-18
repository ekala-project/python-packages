{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  hypothesis,
  lark,
  libcst,
}:

buildPythonPackage rec {
  pname = "hypothesmith";
  version = "0.3.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-lsFIAtbI6F2JdSZBdoeNtUso0u2SH9v+3C5rjOPIFxY=";
  };

  build-system = [ setuptools ];

  dependencies = [
    hypothesis
    lark
    libcst
  ];

  pythonImportsCheck = [ "hypothesmith" ];

  meta = {
    description = "Hypothesis strategies for generating Python programs";
    homepage = "https://github.com/Zac-HD/hypothesmith";
    license = lib.licenses.mpl20;
  };
}
