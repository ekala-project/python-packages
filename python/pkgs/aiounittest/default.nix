{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  wrapt,
}:

buildPythonPackage rec {
  pname = "aiounittest";
  version = "1.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "kwarunek";
    repo = "aiounittest";
    tag = version;
    hash = "sha256-zX3KpDw7AaEwOLkiHX/ZD+rSMeN7qi9hOVAmVH6Jxgg=";
  };

  build-system = [ setuptools ];

  dependencies = [ wrapt ];

  pythonImportsCheck = [ "aiounittest" ];

  meta = {
    description = "Test asyncio code more easily";
    homepage = "https://github.com/kwarunek/aiounittest";
    license = lib.licenses.mit;
  };
}
