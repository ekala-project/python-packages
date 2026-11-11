{
  lib,
  buildPythonPackage,
  fetchPypi,
  stdenv,

  # build-system
  hatchling,

  # native dependencies
  libxrandr,
  libxfixes,
  libx11,
  libxcb,
}:

buildPythonPackage (finalAttrs: {
  pname = "mss";
  version = "10.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-qycYYHdVReYvKdexH4LyeawQSPW73SbPrYSDAgjb05M=";
  };

  # ctypes.util.find_library doesn't work in the Nix sandbox/runtime; hardcode
  # library paths for both the legacy Xlib and the default XCB backends.
  postPatch = lib.optionalString stdenv.hostPlatform.isLinux ''
    substituteInPlace src/mss/linux/xlib.py \
      --replace-fail 'find_library("X11")' '"${lib.getLib libx11}/lib/libX11.so"' \
      --replace-fail 'find_library("Xfixes")' '"${lib.getLib libxfixes}/lib/libXfixes.so"' \
      --replace-fail 'find_library("Xrandr")' '"${lib.getLib libxrandr}/lib/libXrandr.so"'
    substituteInPlace src/mss/linux/xcbhelpers.py \
      --replace-fail 'ctypes.util.find_library("xcb")' '"${lib.getLib libxcb}/lib/libxcb.so"' \
      --replace-fail 'ctypes.util.find_library("xcb-randr")' '"${lib.getLib libxcb}/lib/libxcb-randr.so"' \
      --replace-fail 'ctypes.util.find_library("xcb-render")' '"${lib.getLib libxcb}/lib/libxcb-render.so"' \
      --replace-fail 'ctypes.util.find_library("xcb-shm")' '"${lib.getLib libxcb}/lib/libxcb-shm.so"' \
      --replace-fail 'ctypes.util.find_library("xcb-xfixes")' '"${lib.getLib libxcb}/lib/libxcb-xfixes.so"'
  '';

  build-system = [ hatchling ];

  doCheck = stdenv.hostPlatform.isLinux;
  pythonImportsCheck = [ "mss" ];

  meta = {
    description = "Cross-platform multiple screenshots module";
    mainProgram = "mss";
    homepage = "https://github.com/BoboTiG/python-mss";
    license = lib.licenses.mit;
  };
})
