{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyinotify";
  version = "0.9.6";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-nJmKXXYGyoNQZc2rwBOubGbrnqdqAKHjvG4M/itPcfQ=";
  };

  build-system = [ setuptools ];

  meta = {
    homepage = "https://github.com/seb-m/pyinotify/wiki";
    description = "Monitor filesystems events on Linux platforms with inotify";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
  };
})
