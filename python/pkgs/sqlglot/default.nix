{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  python-dateutil,
}:

buildPythonPackage rec {
  pname = "sqlglot";
  version = "28.9.0";
  pyproject = true;

  src = fetchFromGitHub {
    repo = "sqlglot";
    owner = "tobymao";
    tag = "v${version}";
    hash = "sha256-2AmHKGAoDF8w9k8VN9d25Js3UiSh8YNqdGRHN7VqRpw=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    python-dateutil
  ];

  pythonImportsCheck = [ "sqlglot" ];

  meta = {
    description = "No dependency Python SQL parser, transpiler, and optimizer";
    homepage = "https://github.com/tobymao/sqlglot";
    license = lib.licenses.mit;
  };
}
