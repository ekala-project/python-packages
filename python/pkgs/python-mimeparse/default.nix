{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "python-mimeparse";
  version = "2.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "python_mimeparse";
    inherit version;
    hash = "sha256-W5qdz3qoJGXjG9Zn9ctwAGBIEdzoNVTxyKQ2k6MsswM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "mimeparse" ];

  meta = {
    homepage = "https://github.com/falconry/python-mimeparse";
    description = "Basic functions for parsing mime-type names and matching them against a list of media-ranges";
    license = lib.licenses.mit;
  };
}
