{
  lib,
  buildPythonPackage,
  fastcore,
  fetchPypi,
  ipython,
  setuptools,
  traitlets,
}:

buildPythonPackage (finalAttrs: {
  pname = "execnb";
  version = "0.3.4";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-2ttR/KDOeXYnnCKQ1/5+ZLEWrlz6nmWFly496nWZbAw=";
  };

  build-system = [ setuptools ];

  # 0.3.4 requires fastcore>=2.2.34, but all used APIs exist in 2.2.22
  pythonRelaxDeps = [ "fastcore" ];

  dependencies = [
    fastcore
    ipython
    traitlets
  ];

  # no real tests

  pythonImportsCheck = [ "execnb" ];

  meta = {
    description = "Execute a jupyter notebook, fast, without needing jupyter";
    homepage = "https://github.com/fastai/execnb";
    license = lib.licenses.asl20;
    mainProgram = "exec_nb";
  };
})
