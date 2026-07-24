{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  boltons,
  attrs,
  face,
}:

buildPythonPackage rec {
  pname = "glom";
  version = "25.12.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-GufaiL42k99ArSe99Xp2WlXAdchslxvN3WeSdAPrAGk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    boltons
    attrs
    face
  ];

  pythonImportsCheck = [ "glom" ];

  meta = {
    description = "Module for restructuring data";
    homepage = "https://github.com/mahmoud/glom";
    license = lib.licenses.bsd3;
  };
}
