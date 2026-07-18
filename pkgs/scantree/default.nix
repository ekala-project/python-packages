{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  versioneer,
  attrs,
  pathspec,
}:

buildPythonPackage rec {
  pname = "scantree";
  version = "0.0.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Fb1cskSDsE2yxwZTYE6Oo1IumAh9t+OKuEgvBTmEwKw=";
  };

  build-system = [
    setuptools
    versioneer
  ];

  dependencies = [
    attrs
    pathspec
  ];

  pythonImportsCheck = [ "scantree" ];

  meta = {
    description = "Flexible recursive directory iterator";
    homepage = "https://github.com/andhus/scantree";
    license = lib.licenses.mit;
  };
}
