{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  invoke,
  mock,
  pytest-cov-stub,
  setuptools,
  sphinx-rtd-theme,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "pydash";
  version = "8.0.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dgilland";
    repo = "pydash";
    tag = "v${version}";
    hash = "sha256-8DPeM9Q9NrlVF9a6vIfJLGyyB2SrWpZZRHZKqU/DT2w=";
  };

  build-system = [ setuptools ];

  dependencies = [ typing-extensions ];
  pythonImportsCheck = [ "pydash" ];
  meta = {
    description = "Python utility libraries for doing stuff in a functional way";
    homepage = "https://pydash.readthedocs.io";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
