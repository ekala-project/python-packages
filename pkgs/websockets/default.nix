{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "websockets";
  version = "16.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aaugustin";
    repo = "websockets";
    tag = version;
    hash = "sha256-75FkU45qbOb+xbJO4VKqfWBTep+Toh6OWch2WXnU4bg=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "websockets" ];

  meta = {
    description = "WebSocket implementation in Python";
    homepage = "https://websockets.readthedocs.io/";
    license = lib.licenses.bsd3;
  };
}
