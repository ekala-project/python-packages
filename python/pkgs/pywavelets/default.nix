{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  meson-python,
  cython,
  numpy,
}:

buildPythonPackage rec {
  pname = "pywavelets";
  version = "1.9.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "PyWavelets";
    repo = "pywt";
    tag = "v${version}";
    hash = "sha256-UVQWZPuOyUPcWI3cV2u+jQyAZN/RV3aKAT6BQxqRE4M=";
  };

  build-system = [
    meson-python
    cython
    numpy
  ];

  dependencies = [ numpy ];
  # ensure compiled modules are present
  pythonImportsCheck = [
    "pywt"
    "pywt._extensions._cwt"
    "pywt._extensions._dwt"
    "pywt._extensions._pywt"
    "pywt._extensions._swt"
  ];

  meta = {
    description = "Wavelet transform module";
    homepage = "https://github.com/PyWavelets/pywt";
    license = lib.licenses.mit;
  };
}
