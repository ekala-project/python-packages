{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  pytest,
}:

buildPythonPackage rec {
  pname = "pytest-socket";
  version = "0.8.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "miketheman";
    repo = "pytest-socket";
    tag = version;
    hash = "sha256-Z8aCucbYR6kIgrtZlITPjElwBiIW7DhAk5oTnuiEwWQ=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'requires = ["uv_build>=0.7.20,<0.13.0"]' 'requires = ["hatchling"]' \
      --replace-fail 'build-backend = "uv_build"' 'build-backend = "hatchling.build"'
  '';

  build-system = [ hatchling ];

  buildInputs = [ pytest ];

  # pytest-socket require network for majority of tests
  doCheck = false;

  pythonImportsCheck = [ "pytest_socket" ];

  meta = {
    description = "Pytest Plugin to disable socket calls during tests";
    homepage = "https://github.com/miketheman/pytest-socket";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
