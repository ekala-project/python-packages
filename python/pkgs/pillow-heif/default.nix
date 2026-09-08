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

let
  # Disable gdk-pixbuf plugin in libheif to avoid broken gdk-pixbuf build;
  # pillow-heif only needs the core library, not the gdk-pixbuf loader.
  libheif' = libheif.overrideAttrs (old: {
    buildInputs = lib.filter (i: i.pname or "" != "gdk-pixbuf") old.buildInputs;
    cmakeFlags = (old.cmakeFlags or [ ]) ++ [ "-DWITH_GDK_PIXBUF=OFF" ];
    env = builtins.removeAttrs (old.env or { }) [ "PKG_CONFIG_GDK_PIXBUF_2_0_GDK_PIXBUF_MODULEDIR" ];
  });
in

buildPythonPackage rec {
  pname = "pillow-heif";
  version = "1.7.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "bigcat88";
    repo = "pillow_heif";
    tag = "v${version}";
    hash = "sha256-OATq+z6lQLEYh3tFCcW5WRTdAFrjjnZ4yNig8NPiUTM=";
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
    libheif'
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
