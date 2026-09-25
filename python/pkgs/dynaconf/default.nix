{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "dynaconf";
  version = "3.3.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dynaconf";
    repo = "dynaconf";
    tag = version;
    hash = "sha256-rIATIZLcvb8UtUFGjOSdNd0Wlb4CceDp9B1OdlnIlYc=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "dynaconf" ];

  meta = {
    description = "Dynamic configurator for Python Project";
    homepage = "https://github.com/dynaconf/dynaconf";
    mainProgram = "dynaconf";
    license = lib.licenses.mit;
  };
}
