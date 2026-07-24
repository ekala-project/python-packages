{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "querystring_parser";
  version = "1.2.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ZE/OHP/gUwRTtDqDo4CU2+QizLqMmy8qHAAoDhTKimI=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "querystring_parser" ];

  meta = {
    description = "Module to handle nested dictionaries";
    homepage = "https://github.com/bernii/querystring-parser";
    license = lib.licenses.mit;
  };
}
