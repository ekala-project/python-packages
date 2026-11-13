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
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "line-profiler";
  version = "5.1.0";
  pyproject = true;

  disabled = isPyPy;

  src = fetchPypi {
    pname = "line_profiler";
    inherit (finalAttrs) version;
    hash = "sha256-Vxei3M8M7WX9GbpeR5WBxHQSgx/naLwhHG0PW6Gtm0c=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [
    cython
    cmake
    scikit-build
  ];

  dependencies = [ typing-extensions ];

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
})
