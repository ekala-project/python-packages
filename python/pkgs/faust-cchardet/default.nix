{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  cython,
  meson-python,
  python,
}:

buildPythonPackage rec {
  pname = "faust-cchardet";
  version = "3.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "faust-streaming";
    repo = "cChardet";
    tag = "v${version}";
    fetchSubmodules = true;
    hash = "sha256-jXMf553NsgXgjuvEMKEst8s8k6nE5868DvUPV3Udvvk=";
  };

  build-system = [
    meson-python
    cython
  ];

  postFixup = ''
    # fake cchardet distinfo, so packages that depend on cchardet
    # accept it as a drop-in replacement
    ln -s $out/${python.sitePackages}/{faust_,}cchardet-${version}.dist-info
  '';

  pythonImportsCheck = [ "cchardet" ];
  meta = {
    description = "High-speed universal character encoding detector";
    mainProgram = "cchardetect";
    homepage = "https://github.com/faust-streaming/cChardet";
    license = lib.licenses.mpl11;
  };
}
