{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  django,
  six,
  pycrypto,
}:

buildPythonPackage (finalAttrs: {
  pname = "libthumbor";
  version = "2.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-1PsiFZrTDVQqy8A3nkaM5LdPiBoriRgHkklTOiczN+g=";
  };

  build-system = [ setuptools ];

  buildInputs = [ django ];

  dependencies = [
    six
    pycrypto
  ];

  pythonImportsCheck = [ "libthumbor" ];

  meta = {
    description = "Python extension to thumbor";
    homepage = "https://github.com/heynemann/libthumbor";
    license = lib.licenses.mit;
  };
})
