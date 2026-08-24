{
  lib,
  buildPythonPackage,
  fetchPypi,
  python,
  cffi,
  pkg-config,
  wayland,
  wayland-scanner,
}:

buildPythonPackage rec {
  pname = "pywayland";
  version = "0.4.18";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-WYreAng6rQWjKPZjtRtpTFq2i9XR4JJsDaPFISxWZTM=";
  };

  depsBuildBuild = [ pkg-config ];
  nativeBuildInputs = [ wayland-scanner ];
  propagatedNativeBuildInputs = [ cffi ];
  buildInputs = [ wayland ];
  propagatedBuildInputs = [ cffi ];

  postBuild = ''
    ${python.pythonOnBuildForHost.interpreter} pywayland/ffi_build.py
  '';

  meta = {
    homepage = "https://github.com/flacjacket/pywayland";
    description = "Python bindings to wayland using cffi";
    mainProgram = "pywayland-scanner";
    license = lib.licenses.ncsa;
    maintainers = [ ];
  };
}
