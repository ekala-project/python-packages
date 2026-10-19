{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "websockets";
  version = "17.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aaugustin";
    repo = "websockets";
    tag = finalAttrs.version;
    hash = "sha256-7qY2u0rIHnwQNZtgZ59YOcO2EKCV++/lc9q1BHRdJr0=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "websockets" ];

  meta = {
    description = "WebSocket implementation in Python";
    homepage = "https://websockets.readthedocs.io/";
    license = lib.licenses.bsd3;
  };
})
