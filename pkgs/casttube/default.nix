{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  requests,
}:

buildPythonPackage rec {
  pname = "casttube";
  version = "0.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-VNKvjHlJqpxduH+xHvCkeKXT56xtLSrI3RcR46UW/II=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  doCheck = false;

  pythonImportsCheck = [ "casttube" ];

  meta = {
    description = "Interact with the Youtube Chromecast api";
    homepage = "https://github.com/ur1katz/casttube";
    license = lib.licenses.mit;
  };
}
