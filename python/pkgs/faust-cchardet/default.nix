{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  cython,
  pkgconfig,
  setuptools,
  wheel,
  python,
}:

buildPythonPackage rec {
  pname = "faust-cchardet";
  version = "2.1.19";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "faust-streaming";
    repo = "cChardet";
    tag = "v${version}";
    fetchSubmodules = true;
    hash = "sha256-yY6YEhXC4S47rxnkKAta4m16IVGn7gkHSt056bYOYJ4=";
  };

  nativeBuildInputs = [
    cython
    pkgconfig
    setuptools
    wheel
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
    maintainers = [ ];
  };
}
