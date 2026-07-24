{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "janus";
  version = "2.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-CXDzjg5yVABJbINKNopn7lUdw7WtCiV+Ey9bRvLnd3A=";
  };

  build-system = [ setuptools ];

  dependencies = [ typing-extensions ];

  pythonImportsCheck = [ "janus" ];

  meta = {
    description = "Mixed sync-async queue";
    homepage = "https://github.com/aio-libs/janus";
    license = lib.licenses.asl20;
  };
}
