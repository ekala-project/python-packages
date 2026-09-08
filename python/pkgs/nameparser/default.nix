{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  unittestCheckHook,
}:

buildPythonPackage rec {
  pname = "nameparser";
  version = "2.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-EyDHOIYvwXC1oU+plv8QMnfl+HoU2h1C3cJU1w+7ZJE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "nameparser" ];

  meta = {
    description = "Module for parsing human names into their individual components";
    homepage = "https://github.com/derek73/python-nameparser";
    license = lib.licenses.lgpl21Plus;
    maintainers = [ ];
  };
}
