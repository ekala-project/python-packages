{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "vdf";
  version = "3.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-/VQZ9B4HoQCeX/0CfH3L5D0ffo70U66qkNnQS4B94q8=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "vdf" ];

  meta = {
    description = "Library for working with Valve's VDF text format";
    homepage = "https://github.com/ValvePython/vdf";
    license = lib.licenses.mit;
  };
}
