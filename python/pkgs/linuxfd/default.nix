{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "linuxfd";
  version = "1.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "b8c00109724b68e093f9b556edd78e41ed65fb8d969fd0e83186a97b5d3139b4";
  };

  build-system = [ setuptools ];

  # no tests

  meta = {
    description = "Python bindings for the Linux eventfd/signalfd/timerfd/inotify syscalls";
    homepage = "https://github.com/FrankAbelbeck/linuxfd";
    platforms = lib.platforms.linux;
    license = lib.licenses.lgpl3Plus;
  };
}
