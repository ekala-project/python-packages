{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pylsqpack";
  version = "1.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-CL8maJPcrtgX1yrBRQaglcl7MJ9orlemlGmdGGZgRQ4=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pylsqpack" ];

  meta = {
    description = "Python wrapper for the ls-qpack QPACK library";
    homepage = "https://github.com/aiortc/pylsqpack";
    license = lib.licenses.bsd3;
  };
})
