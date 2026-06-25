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
  version = "27.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-rAdl49REVa223b9EF9zORg/ECgWXjAjv3ylIBy9ttUA=";
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
