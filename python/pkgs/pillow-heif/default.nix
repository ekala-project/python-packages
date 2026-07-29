{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  cmake,
  nasm,
  pkg-config,
  setuptools,

  # native dependencies
  libheif,
  libaom,
  libde265,
  x265,

  # dependencies
  pillow,
}:

buildPythonPackage rec {
  pname = "pillow-heif";
  version = "1.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "bigcat88";
    repo = "pillow_heif";
    tag = "v${version}";
    hash = "sha256-EaislmA4v2qKCDQ87I85Pn8IlS4VJWyNXkITipKSBC8=";
  };

  postPatch = ''
    sed -i '/addopts/d' pyproject.toml
    substituteInPlace setup.py \
      --replace-warn ', "-Werror"' ""
  '';

  nativeBuildInputs = [
    cmake
    nasm
    pkg-config
  ];

  build-system = [ setuptools ];

  dontUseCmakeConfigure = true;

  buildInputs = [
    libaom
    libde265
    libheif
    x265
  ];

  env = {
    RELEASE_FULL_FLAG = 1;
  };

  dependencies = [ pillow ];

  pythonImportsCheck = [ "pillow_heif" ];

  meta = {
    description = "Python library for working with HEIF images and plugin for Pillow";
    homepage = "https://github.com/bigcat88/pillow_heif";
    license = with lib.licenses; [
      bsd3
      lgpl3
    ];
    maintainers = [ ];
  };
}
