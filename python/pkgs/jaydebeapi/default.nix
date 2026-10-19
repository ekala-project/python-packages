{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  jpype1,
}:

buildPythonPackage rec {
  pname = "jaydebeapi";
  version = "1.2.3";
  pyproject = true;

  src = fetchPypi {
    pname = "JayDeBeApi";
    inherit version;
    sha256 = "f25e9307fbb5960cb035394c26e37731b64cc465b197c4344cee85ec450ab92f";
  };

  build-system = [ setuptools ];

  dependencies = [ jpype1 ];

  meta = {
    homepage = "https://github.com/baztian/jaydebeapi";
    license = lib.licenses.lgpl2;
    description = "Use JDBC database drivers from Python 2/3 or Jython with a DB-API";
  };
}
