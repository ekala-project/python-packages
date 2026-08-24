{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  # dependencies
  rope,
  python-lsp-server,
}:

buildPythonPackage rec {
  pname = "pylsp-rope";
  version = "0.1.17";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-rope";
    repo = "pylsp-rope";
    tag = version;
    hash = "sha256-gEmSZQZ2rtSljN8USsUiqsP2cr54k6kwvsz8cjam9dU=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    rope
    python-lsp-server
  ];

  pythonImportsCheck = [ "pylsp_rope" ];

  meta = {
    description = "Extended refactoring capabilities for Python LSP Server using Rope";
    homepage = "https://github.com/python-rope/pylsp-rope";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
