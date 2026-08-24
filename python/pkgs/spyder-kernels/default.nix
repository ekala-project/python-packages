{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  # dependencies
  cloudpickle,
  ipykernel,
  ipython,
  jupyter-client,
  pyxdg,
  pyzmq,
  wurlitzer,
}:

buildPythonPackage (finalAttrs: {
  pname = "spyder-kernels";
  version = "3.1.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "spyder-ide";
    repo = "spyder-kernels";
    tag = "v${finalAttrs.version}";
    hash = "sha256-FdZKWtMRTLq16rULc4lQx4GywtyZ+ori2z85PgK1geM=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "ipykernel"
  ];
  dependencies = [
    cloudpickle
    ipykernel
    ipython
    jupyter-client
    pyxdg
    pyzmq
    wurlitzer
  ];

  pythonImportsCheck = [ "spyder_kernels" ];

  meta = {
    description = "Jupyter kernels for Spyder's console";
    homepage = "https://docs.spyder-ide.org/current/ipythonconsole.html";
    downloadPage = "https://github.com/spyder-ide/spyder-kernels/releases";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
