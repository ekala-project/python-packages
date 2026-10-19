{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  pycurl,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "urlgrabber";
  version = "4.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "075af8afabae6362482d254e5ac3ffa595d1766117b684e53d9c25c2e937e139";
  };

  build-system = [ setuptools ];

  dependencies = [
    pycurl
    six
  ];

  meta = {
    homepage = "http://urlgrabber.baseurl.org";
    license = lib.licenses.lgpl2Plus;
    description = "Python module for downloading files";
    mainProgram = "urlgrabber";
  };
})
