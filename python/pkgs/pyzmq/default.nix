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

buildPythonPackage rec {
  pname = "pyzmq";
  version = "27.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-VNQlnRv64k7Ntcp596zC6sbChqAtagrmF3l8tF8HJtM=";
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
}
