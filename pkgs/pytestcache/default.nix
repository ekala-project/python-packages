{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  execnet,
  pytest,
}:

buildPythonPackage rec {
  pname = "pytestcache";
  version = "1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "pytest-cache";
    inherit version;
    hash = "sha256-vnRo7dTT2D8ehElZ/W4/0o53pIFECnEY1DATDqMbB6k=";
  };

  build-system = [ setuptools ];

  dependencies = [
    execnet
    pytest
  ];

  meta = {
    description = "Pytest plugin with mechanisms for caching across test runs";
    homepage = "https://pypi.org/project/pytest-cache/";
    license = lib.licenses.mit;
  };
}
