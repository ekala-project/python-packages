{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "smpplib";
  version = "2.2.4";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-bzsDb8smQ8G3oyibtaxMmnIK8b9z5XLicp22tdgAwnM=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "smpplib" ];

  meta = {
    description = "SMPP library for Python";
    homepage = "https://github.com/python-smpplib/python-smpplib";
    license = lib.licenses.lgpl3Plus;
  };
})
