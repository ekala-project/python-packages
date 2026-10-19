{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  python-xlib,
}:

buildPythonPackage (finalAttrs: {
  pname = "ewmh";
  version = "0.1.6";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "0g9l14my3v8zlgq1yd8wh5gpara0qcapsfmvg7lq2lapglzhjsy5";
  };

  build-system = [ setuptools ];

  dependencies = [ python-xlib ];

  # No tests included

  meta = {
    homepage = "https://github.com/parkouss/pyewmh";
    description = "Implementation of EWMH (Extended Window Manager Hints), based on Xlib";
    license = lib.licenses.lgpl3Plus;
  };
})
