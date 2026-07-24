{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  httpx,
  pyjwt,
  pytest-asyncio,
  pytest-httpx,
  setuptools,
  setuptools-scm,
  time-machine,
}:

buildPythonPackage rec {
  pname = "httpx-auth";
  version = "0.23.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Colin-b";
    repo = "httpx_auth";
    tag = "v${version}";
    hash = "sha256-wrPKUAGBzzuWNtwYtTtqOhb1xqYgc83uxn4rjbfDPmo=";
  };

  nativeBuildInputs = [
    setuptools
    setuptools-scm
  ];

  propagatedBuildInputs = [ httpx ];
  pythonImportsCheck = [ "httpx_auth" ];
  meta = {
    description = "Authentication classes to be used with httpx";
    homepage = "https://github.com/Colin-b/httpx_auth";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
