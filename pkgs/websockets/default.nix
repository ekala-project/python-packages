{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "websockets";
  version = "16.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aaugustin";
    repo = "websockets";
    tag = version;
    hash = "sha256-C+XJiflb+nnPyxTEn8z4OWubCzlxEBLHqpG+VLOtIos=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "websockets" ];

  meta = {
    description = "WebSocket implementation in Python";
    homepage = "https://websockets.readthedocs.io/";
    license = lib.licenses.bsd3;
  };
}
