{
  lib,
  buildPythonPackage,
  fastcore,
  fetchPypi,
  ipython,
  setuptools,
  traitlets,
}:

buildPythonPackage rec {
  pname = "execnb";
  version = "0.3.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-0Ca35QfhrNEyBdYf9KCl5tBJjOPDla79h8W0oOGHWu0=";
  };

  build-system = [ setuptools ];

  dependencies = [
    fastcore
    ipython
    traitlets
  ];

  # no real tests
  doCheck = false;

  pythonImportsCheck = [ "execnb" ];

  meta = {
    description = "Execute a jupyter notebook, fast, without needing jupyter";
    homepage = "https://github.com/fastai/execnb";
    license = lib.licenses.asl20;
    maintainers = [ ];
    mainProgram = "exec_nb";
  };
}
