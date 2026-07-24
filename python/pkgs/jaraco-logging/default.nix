{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
  tempora,
}:

buildPythonPackage rec {
  pname = "jaraco-logging";
  version = "3.4.0";
  pyproject = true;

  src = fetchPypi {
    pname = "jaraco_logging";
    inherit version;
    hash = "sha256-59bcg2hHfOaesdbthR2AWJahypQs4/0Xc1gDEbC3dfs=";
  };

  postPatch = ''
    sed -i "/coherent\.licensed/d" pyproject.toml
  '';

  pythonNamespaces = [ "jaraco" ];

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ tempora ];

  pythonImportsCheck = [ "jaraco.logging" ];

  meta = {
    description = "Support for Python logging facility";
    homepage = "https://github.com/jaraco/jaraco.logging";
    license = lib.licenses.mit;
  };
}
