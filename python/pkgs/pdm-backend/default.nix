{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
}:

buildPythonPackage rec {
  pname = "pdm-backend";
  version = "2.4.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pdm-project";
    repo = "pdm-backend";
    tag = version;
    hash = "sha256-082ZSfRUGUV8DX+vuJeOd+HOuAfnKfZPZ3Lyhx6TRlE=";
  };

  env.PDM_BUILD_SCM_VERSION = version;

  pythonImportsCheck = [ "pdm.backend" ];
  setupHook = ./setup-hook.sh;

  meta = {
    homepage = "https://github.com/pdm-project/pdm-backend";
    description = "Yet another PEP 517 backend";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
