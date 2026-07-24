{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  requests,
  toml,
  werkzeug,
}:

buildPythonPackage rec {
  pname = "pytest-httpserver";
  version = "1.1.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "csernazs";
    repo = "pytest-httpserver";
    tag = version;
    hash = "sha256-5pyCDzt9nCwYcUdCjWlJiAkyNmf6oWBqSHQL7kJJluA=";
  };

  nativeBuildInputs = [ poetry-core ];

  propagatedBuildInputs = [ werkzeug ];
  pythonImportsCheck = [ "pytest_httpserver" ];

  meta = {
    description = "HTTP server for pytest to test HTTP clients";
    homepage = "https://www.github.com/csernazs/pytest-httpserver";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
