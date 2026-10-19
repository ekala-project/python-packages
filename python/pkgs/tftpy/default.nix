{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "tftpy";
  version = "0.8.7";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-6KWqCS2rLhy7m5Q5IDaCe4CNw362zxsaszyBlXs/X+I=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "tftpy" ];

  meta = {
    description = "Pure Python TFTP library";
    homepage = "https://github.com/msoulier/tftpy";
    license = lib.licenses.mit;
  };
})
