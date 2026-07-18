{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  requests,
}:

buildPythonPackage rec {
  pname = "deezer-py";
  version = "1.3.7";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-saMy+IeAy6H9SgS8XHnZ9klFerGyr+vQqhuCtimgbEo=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  pythonImportsCheck = [ "deezer" ];

  meta = {
    description = "Wrapper for all Deezer's APIs";
    homepage = "https://gitlab.com/RemixDev/deezer-py";
    license = lib.licenses.gpl3Plus;
  };
}
