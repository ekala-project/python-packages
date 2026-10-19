{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  sphinx,
}:

buildPythonPackage rec {
  pname = "sphinxcontrib-httpdomain";
  version = "1.8.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-bC3+bKKC119m3zM4absM5zMcAbR122gJ/50Qe3zf4Es=";
  };

  build-system = [ setuptools ];

  dependencies = [ sphinx ];

  # Check is disabled due to this issue:
  # https://bitbucket.org/pypa/setuptools/issue/137/typeerror-unorderable-types-str-nonetype

  pythonNamespaces = [ "sphinxcontrib" ];

  meta = {
    description = "Provides a Sphinx domain for describing RESTful HTTP APIs";
    homepage = "https://bitbucket.org/birkenfeld/sphinx-contrib";
    license = lib.licenses.bsd0;
  };
}
