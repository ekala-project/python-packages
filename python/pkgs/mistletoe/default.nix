{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "mistletoe";
  version = "1.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-kvBmxHIKJfokvyYOZBNwK7/zpbipOvMUy2zYWJcmqOE=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "mistletoe" ];

  meta = {
    description = "Fast and extensible Markdown parser";
    homepage = "https://github.com/miyuchina/mistletoe";
    license = lib.licenses.mit;
  };
}
