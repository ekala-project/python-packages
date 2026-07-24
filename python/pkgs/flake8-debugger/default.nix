{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
  flake8,
  pycodestyle,
}:

buildPythonPackage rec {
  pname = "flake8-debugger";
  version = "4.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-UrACVglB422b+Ab8olI9x/uFYKKV1fGm4VrC3tenOEA=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    flake8
    pycodestyle
  ];

  pythonImportsCheck = [ "flake8_debugger" ];

  meta = {
    description = "ipdb/pdb statement checker plugin for flake8";
    homepage = "https://github.com/jbkahn/flake8-debugger";
    license = lib.licenses.mit;
  };
}
