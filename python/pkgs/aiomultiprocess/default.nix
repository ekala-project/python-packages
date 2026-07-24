{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
}:

buildPythonPackage rec {
  pname = "aiomultiprocess";
  version = "0.9.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "omnilib";
    repo = "aiomultiprocess";
    tag = "v${version}";
    hash = "sha256-LWrAr3i2CgOMZFxWi9B3kiou0UtaHdDbpkr6f9pReRA=";
  };

  patches = [
    # https://github.com/omnilib/aiomultiprocess/issues/220
    ./python314-compat.patch
  ];

  build-system = [ flit-core ];
  pythonImportsCheck = [ "aiomultiprocess" ];

  meta = {
    description = "Python module to improve performance";
    longDescription = ''
      aiomultiprocess presents a simple interface, while running a full
      AsyncIO event loop on each child process, enabling levels of
      concurrency never before seen in a Python application. Each child
      process can execute multiple coroutines at once, limited only by
      the workload and number of cores available.
    '';
    homepage = "https://github.com/omnilib/aiomultiprocess";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.fab ];
  };
}
