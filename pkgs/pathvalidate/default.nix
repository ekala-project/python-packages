{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "pathvalidate";
  version = "3.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-sYwHISv+rWJDRbuOHWFBzc8Vo5c2mU6guUA1rSsboXc=";
  };

  build-system = [ setuptools-scm ];

  pythonImportsCheck = [ "pathvalidate" ];

  meta = {
    description = "Library to sanitize/validate a string such as filenames/file-paths/etc";
    homepage = "https://github.com/thombashi/pathvalidate";
    license = lib.licenses.mit;
  };
}
