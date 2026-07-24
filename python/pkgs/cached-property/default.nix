{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "cached-property";
  version = "2.0.1";
  pyproject = true;

  src = fetchPypi {
    pname = "cached_property";
    inherit version;
    hash = "sha256-SE1hcQXj7g5PH1hyXnKo756T3u5GIiLb1RzZEjCJdkE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "cached_property" ];

  meta = {
    description = "Decorator for caching properties in classes";
    homepage = "https://github.com/pydanny/cached-property";
    changelog = "https://github.com/pydanny/cached-property/releases/tag/${version}";
    license = lib.licenses.bsd3;
  };
}
