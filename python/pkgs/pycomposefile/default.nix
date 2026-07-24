{
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
  pyyaml,
}:

buildPythonPackage rec {
  pname = "pycomposefile";
  version = "0.0.34";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-kzqTtDn4aSiCtNUP90ThKj2ZYEAGjpZlGjfdhCEmpQg=";
  };

  build-system = [ flit-core ];

  dependencies = [ pyyaml ];

  pythonImportsCheck = [ "pycomposefile" ];

  meta = {
    description = "Python library for structured deserialization of Docker Compose files";
    homepage = "https://github.com/smurawski/pycomposefile";
    license = lib.licenses.mit;
  };
}
