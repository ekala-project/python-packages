{
  lib,
  stdenv,
  buildPythonPackage,
  callPackage,
  fetchPypi,
  hatchling,
  appnope,
  comm,
  ipython,
  jupyter-client,
  jupyter-core,
  matplotlib-inline,
  nest-asyncio,
  packaging,
  psutil,
  pyzmq,
  tornado,
  traitlets,
}:

buildPythonPackage rec {
  pname = "ipykernel";
  version = "7.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-WKP8iFM9WTDDVG3H6sZsbSiKzeT4AeIAHmXtxdyc8Ns=";
  };

  # debugpy is optional, see https://github.com/ipython/ipykernel/pull/767
  pythonRemoveDeps = [ "debugpy" ];

  nativeBuildInputs = [ hatchling ];

  propagatedBuildInputs = [
    comm
    ipython
    jupyter-client
    jupyter-core
    matplotlib-inline
    nest-asyncio
    packaging
    psutil
    pyzmq
    tornado
    traitlets
  ]
  ++ lib.optionals stdenv.hostPlatform.isDarwin [ appnope ];

  # check in passthru.tests.pytest to escape infinite recursion with ipyparallel
  meta = {
    description = "IPython Kernel for Jupyter";
    homepage = "https://ipython.org/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
