{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  eth-utils,
  hypothesis,
  pydantic,
}:

buildPythonPackage rec {
  pname = "hexbytes";
  version = "1.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "hexbytes";
    tag = "v${version}";
    hash = "sha256-xYXxlyVGdsksxZJtSpz1V3pj4NL7IzX0gaQeCoiHr8g=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "hexbytes" ];

  meta = {
    description = "`bytes` subclass that decodes hex, with a readable console output";
    homepage = "https://github.com/ethereum/hexbytes";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
