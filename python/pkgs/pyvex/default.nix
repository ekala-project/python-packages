{
  lib,
  bitstring,
  buildPythonPackage,
  cffi,
  cmake,
  fetchPypi,
  ninja,
  pycparser,
  scikit-build-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyvex";
  version = "10.0.6";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-1ilB61Fb/9yQ+oUjgaNtZE/SIW/YogWVVhhLPRumk8g=";
  };

  build-system = [
    cffi
    pycparser
    scikit-build-core
  ];

  nativeBuildInputs = [
    cmake
    ninja
  ];

  dontUseCmakeConfigure = true;

  dependencies = [
    bitstring
    cffi
    pycparser
  ];

  pythonRelaxDeps = [ "bitstring" ];

  # No tests are available on PyPI, GitHub release has tests
  # Switch to GitHub release after all angr parts are present

  pythonImportsCheck = [ "pyvex" ];

  meta = {
    description = "Python interface to libVEX and VEX IR";
    homepage = "https://github.com/angr/pyvex";
    license = with lib.licenses; [
      bsd2
      gpl2Plus
    ];
  };
})
