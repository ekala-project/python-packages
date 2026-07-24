{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  pytest,
  docutils,
  pygments,
  pytest-rerunfailures,
  pytest-asyncio,
  anyio,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "pytest-subprocess";
  version = "1.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aklajnert";
    repo = "pytest-subprocess";
    tag = version;
    hash = "sha256-zPKExIrCt8ZwhKGU0l3tyTcDhRIGPSiM8OWy5cpmsuE=";
  };

  build-system = [ setuptools ];

  buildInputs = [ pytest ];
  meta = {
    description = "Plugin to fake subprocess for pytest";
    homepage = "https://github.com/aklajnert/pytest-subprocess";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
