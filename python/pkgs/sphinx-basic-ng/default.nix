{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  sphinx,
}:

buildPythonPackage rec {
  pname = "sphinx-basic-ng";
  version = "1.0.0b2";
  pyproject = true;

  src = fetchPypi {
    pname = "sphinx_basic_ng";
    inherit version;
    hash = "sha256-nsVaR8kMjAArWWDFdJLsMCH1GTyybOvC3E6iJoSGUck=";
  };

  build-system = [ setuptools ];

  dependencies = [ sphinx ];

  pythonImportsCheck = [ "sphinx_basic_ng" ];

  meta = {
    description = "Modernised skeleton for Sphinx themes";
    homepage = "https://sphinx-basic-ng.readthedocs.io/en/latest/";
    license = lib.licenses.mit;
  };
}
