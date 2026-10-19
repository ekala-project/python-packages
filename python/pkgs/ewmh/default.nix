{
  lib,
  buildPythonPackage,
  fetchPypi,
  python-xlib,
}:

buildPythonPackage rec {
  pname = "ewmh";
  version = "0.1.6";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0g9l14my3v8zlgq1yd8wh5gpara0qcapsfmvg7lq2lapglzhjsy5";
  };

  dependencies = [ python-xlib ];

  # No tests included

  meta = {
    homepage = "https://github.com/parkouss/pyewmh";
    description = "Implementation of EWMH (Extended Window Manager Hints), based on Xlib";
    license = lib.licenses.lgpl3Plus;
  };
}
