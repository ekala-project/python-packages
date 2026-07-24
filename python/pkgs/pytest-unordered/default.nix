{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  pytest,
}:

buildPythonPackage rec {
  pname = "pytest-unordered";
  version = "0.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "utapyngo";
    repo = "pytest-unordered";
    tag = "v${version}";
    hash = "sha256-0Zh58qWKJIUL/7ELiZmyFNVKUyiJeckpYTQBnqKROo4=";
  };

  build-system = [ setuptools ];

  buildInputs = [ pytest ];
  pythonImportsCheck = [ "pytest_unordered" ];

  meta = {
    description = "Test equality of unordered collections in pytest";
    homepage = "https://github.com/utapyngo/pytest-unordered";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
