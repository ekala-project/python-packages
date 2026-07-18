{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "versiontools";
  version = "1.9.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-qWkzKIehipyYsN8OpNTKdZcvJMqU8G+4fVkTd+g0FPY=";
  };

  build-system = [ setuptools ];

  # versiontools imports distutils (via setuptools_hooks) which was removed in Python 3.12+
  dependencies = [ setuptools ];

  # import fails on Python 3.13+ due to distutils removal
  dontUsePythonImportsCheck = true;

  meta = {
    homepage = "https://launchpad.net/versiontools";
    description = "Smart replacement for plain tuple used in __version__";
    license = lib.licenses.lgpl2;
  };
}
