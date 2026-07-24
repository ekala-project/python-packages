{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  cython,
  pkgconfig,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "uharfbuzz";
  version = "0.55.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "harfbuzz";
    repo = "uharfbuzz";
    tag = "v${version}";
    fetchSubmodules = true;
    hash = "sha256-rarwERSsq5KpuSnbxwsJpGrZXFM0D7HDCkJxoBRQqVc=";
  };

  build-system = [
    cython
    pkgconfig
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "uharfbuzz" ];

  meta = {
    homepage = "https://github.com/harfbuzz/uharfbuzz";
    description = "Streamlined Cython bindings for the harfbuzz shaping engine";
    license = lib.licenses.asl20;
  };
}
