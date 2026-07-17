{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  docutils,
  nh3,
  pygments,
}:

buildPythonPackage rec {
  pname = "readme-renderer";
  version = "44.0";
  pyproject = true;

  src = fetchPypi {
    pname = "readme_renderer";
    inherit version;
    hash = "sha256-hxIDTqu/poBcrPFAK07rKnMCj3LRFm1vXLf5wEfF0eE=";
  };

  build-system = [ setuptools ];

  dependencies = [
    docutils
    nh3
    pygments
  ];

  doCheck = false;

  pythonImportsCheck = [ "readme_renderer" ];

  meta = {
    description = "Python library for rendering readme descriptions";
    homepage = "https://github.com/pypa/readme_renderer";
    license = lib.licenses.asl20;
  };
}
