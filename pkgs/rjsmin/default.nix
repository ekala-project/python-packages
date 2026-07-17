{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "rjsmin";
  version = "1.2.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-o/gECwJz3sdz4OgH6GpNCpU1UWwKCjWqG7bebhW7Hwk=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "rjsmin" ];

  meta = {
    homepage = "http://opensource.perlig.de/rjsmin/";
    description = "Module to minify Javascript";
    license = lib.licenses.asl20;
  };
}
