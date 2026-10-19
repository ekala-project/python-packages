{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  cython,
  isPyPy,
  ipython,
  scikit-build,
  cmake,
  ubelt,
}:

buildPythonPackage rec {
  pname = "line-profiler";
  version = "5.0.2";
  pyproject = true;

  disabled = isPyPy;

  src = fetchPypi {
    pname = "line_profiler";
    inherit version;
    hash = "sha256-jYqZDITGS83kWvIq9QLRe8CuEHvkBc5Bu6kq9cOcAAA=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [
    cython
    cmake
    scikit-build
  ];

  optional-dependencies = {
    ipython = [ ipython ];
  };
  dontUseCmakeConfigure = true;

  preBuild = ''
    rm -f _line_profiler.c
  '';
  pythonImportsCheck = [ "line_profiler" ];

  meta = {
    description = "Line-by-line profiler";
    mainProgram = "kernprof";
    homepage = "https://github.com/pyutils/line_profiler";
    license = lib.licenses.bsd3;
  };
}
