{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "supervisor";
  version = "4.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-SivxSa30KZfhu0S3DEO2EydeyYUsPtrMqGqRZrJ+lF4=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "supervisor" ];

  meta = {
    description = "System for controlling process state under UNIX";
    homepage = "https://supervisord.org/";
    mainProgram = "supervisord";
    license = lib.licenses.free;
  };
})
