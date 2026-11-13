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
  packaging,
  psutil,
  pyzmq,
  tornado,
  traitlets,
}:

buildPythonPackage (finalAttrs: {
  pname = "ipykernel";
  version = "7.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-QzARTSK5szV1ssfGh1P8j6q7vPvGCwzf+fFN1M5jdC8=";
  };

  pythonRemoveDeps = [
    # debugpy is optional, see https://github.com/ipython/ipykernel/pull/767
    "debugpy"
    # only needed for the tk event loop; not packaged yet
    "nest-asyncio2"
  ];

  pythonRelaxDeps = [ "tornado" ];

  nativeBuildInputs = [ hatchling ];

  dependencies = [
    comm
    ipython
    jupyter-client
    jupyter-core
    matplotlib-inline
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
  };
})
