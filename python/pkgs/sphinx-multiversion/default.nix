{
  lib,
  buildPythonPackage,
  fetchPypi,
  sphinx,
  setuptools,
}:

buildPythonPackage rec {
  pname = "sphinx-multiversion";
  version = "0.2.4";

  pyproject = true;

  src = fetchPypi {
    inherit version;
    pname = "sphinx-multiversion";
    hash = "sha256-XNHKnste7WPLjWzl6cQ4yhOvT6mOfrbzdr5UHdSZC8s=";
  };

  build-system = [ setuptools ];
  dependencies = [ sphinx ];

  pythonImportsCheck = [ "sphinx_multiversion" ];

  meta = {
    description = "Sphinx extension for building self-hosted versioned docs";
    homepage = "https://sphinx-contrib.github.io/multiversion";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}
