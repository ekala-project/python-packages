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
  version = "1.1.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "csernazs";
    repo = "pytest-httpserver";
    tag = version;
    hash = "sha256-6GU7LwCy5BacgdT1owrzN1NYazRE4zHSVl4hxPhrYSo=";
  };

  nativeBuildInputs = [ poetry-core ];

  propagatedBuildInputs = [ werkzeug ];
  pythonImportsCheck = [ "pytest_httpserver" ];

  meta = {
    description = "HTTP server for pytest to test HTTP clients";
    homepage = "https://www.github.com/csernazs/pytest-httpserver";
    license = lib.licenses.mit;
  };
}
