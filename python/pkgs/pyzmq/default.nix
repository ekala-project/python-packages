{
  lib,
  buildPythonPackage,
  fetchPypi,
  isPyPy,
  cffi,
  cython,
  cmake,
  ninja,
  packaging,
  pathspec,
  scikit-build-core,
  libsodium,
  zeromq,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyzmq";
  version = "27.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-u+2z0dmbq8Yl8d2ddDis79RCs2t1Bz/WvB73wKS5bVY=";
  };

  build-system = [
    cmake
    ninja
    packaging
    pathspec
    scikit-build-core
  ]
  ++ (if isPyPy then [ cffi ] else [ cython ]);

  dontUseCmakeConfigure = true;

  buildInputs = [
    libsodium
    zeromq
  ];

  dependencies = lib.optionals isPyPy [ cffi ];

  pythonImportsCheck = [ "zmq" ];

  meta = {
    description = "Python bindings for ØMQ";
    homepage = "https://pyzmq.readthedocs.io/";
    license = with lib.licenses; [
      bsd3
      lgpl3Only
    ];
  };
})
