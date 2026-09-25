{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flask,
  flask-migrate,
  flask-sqlalchemy-lite,
  ldap3,
  pytestCheckHook,
  setuptools,
}:

buildPythonPackage rec {
  pname = "automx2";
  version = "2026.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "rseichter";
    repo = "automx2";
    tag = version;
    hash = "sha256-MT295HIcYJSsBmGaAK6V1yH49pj2A7e2E9H4QB955yc=";
  };

  build-system = [ setuptools ];

  dependencies = [
    flask
    flask-migrate
    flask-sqlalchemy-lite
    ldap3
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "automx2" ];

  meta = {
    description = "Email client configuration made easy";
    homepage = "https://rseichter.github.io/automx2/";
    license = lib.licenses.gpl3Plus;
  };
}
