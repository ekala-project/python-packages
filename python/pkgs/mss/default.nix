{
  lib,
  buildPythonPackage,
  fetchPypi,
  stdenv,
  replaceVars,

  # build-system
  hatchling,

  # native dependencies
  libxrandr,
  libxfixes,
  libx11,
}:

buildPythonPackage rec {
  pname = "mss";
  version = "10.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-cYK69+4WylaeKAQCi2q5vL9r5cRvwogIQPM7UTuctPg=";
  };

  patches = lib.optionals stdenv.hostPlatform.isLinux [
    (replaceVars ./linux-paths.patch {
      x11 = "${libx11}/lib/libX11.so";
      xfixes = "${libxfixes}/lib/libXfixes.so";
      xrandr = "${libxrandr}/lib/libXrandr.so";
    })
  ];

  build-system = [ hatchling ];

  doCheck = stdenv.hostPlatform.isLinux;
  pythonImportsCheck = [ "mss" ];

  meta = {
    description = "Cross-platform multiple screenshots module";
    mainProgram = "mss";
    homepage = "https://github.com/BoboTiG/python-mss";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
