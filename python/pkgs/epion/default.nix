{
  lib,
  buildPythonPackage,
  docopt,
  fetchFromGitHub,
  pytz,
  requests,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "epion";
  version = "0.0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "devenzo-com";
    repo = "epion_python";
    tag = finalAttrs.version;
    hash = "sha256-9tE/SqR+GHZXeE+bOtXkLu+4jy1vO8WoiLjb6MJazxQ=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [
    docopt
    pytz
    requests
  ];

  # Module has no tests

  pythonImportsCheck = [ "epion" ];

  meta = {
    description = "Module to access Epion sensor data";
    homepage = "https://github.com/devenzo-com/epion_python";
    license = lib.licenses.mit;
  };
})
