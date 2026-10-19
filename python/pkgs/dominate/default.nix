{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "dominate";
  version = "2.9.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-VYKEaH2biq4ZBOPWBRrRMt1KjAz1UbN+pOfkKjHRncQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "dominate" ];

  meta = {
    description = "Library for creating and manipulating HTML documents using an elegant DOM API";
    homepage = "https://github.com/Knio/dominate/";
    changelog = "https://github.com/Knio/dominate/releases/tag/${finalAttrs.version}";
    license = lib.licenses.lgpl3Plus;
  };
})
