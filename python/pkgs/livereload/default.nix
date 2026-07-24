{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  tornado,
}:

buildPythonPackage rec {
  pname = "livereload";
  version = "2.7.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-PZv3wFZz3wbjK+ojtJS402ym0Q99XDyKaYlgjAnJhqk=";
  };

  build-system = [ setuptools ];

  dependencies = [ tornado ];

  pythonImportsCheck = [ "livereload" ];

  meta = {
    description = "Runs a local server that reloads as you develop";
    mainProgram = "livereload";
    homepage = "https://github.com/lepture/python-livereload";
    license = lib.licenses.bsd3;
  };
}
