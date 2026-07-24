{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,
  replaceVars,

  # build-system
  flit-core,

  # dependencies
  cffi,

  # native libraries
  cairo,
  glib,
  gdk-pixbuf,
}:

buildPythonPackage rec {
  pname = "cairocffi";
  version = "1.7.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-LkjuhkiE7Eo6NL+oyauZmfaIKG63FKFaQ+ydBow2VXs=";
  };

  patches = [
    (replaceVars ./dlopen-paths.patch {
      ext = stdenv.hostPlatform.extensions.sharedLibrary;
      cairo = cairo.out;
      glib = glib.out;
      gdk_pixbuf = gdk-pixbuf.out;
    })
  ];

  build-system = [ flit-core ];

  dependencies = [ cffi ];

  pythonImportsCheck = [ "cairocffi" ];

  meta = {
    description = "cffi-based cairo bindings for Python";
    homepage = "https://github.com/Kozea/cairocffi";
    license = lib.licenses.bsd3;
  };
}
