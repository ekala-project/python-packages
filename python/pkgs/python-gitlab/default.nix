{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  requests,
  requests-toolbelt,
}:

buildPythonPackage rec {
  pname = "python-gitlab";
  version = "8.4.0";
  pyproject = true;

  src = fetchPypi {
    pname = "python_gitlab";
    inherit version;
    hash = "sha256-828g7D8JE487EgiTlJQfTb5aQHAhvtcbcKBLvdN7inQ=";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    requests-toolbelt
  ];

  pythonImportsCheck = [ "gitlab" ];

  meta = {
    description = "Interact with GitLab API";
    homepage = "https://github.com/python-gitlab/python-gitlab";
    license = lib.licenses.lgpl3Only;
  };
}
